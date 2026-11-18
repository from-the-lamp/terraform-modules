data "oneuptime_incident_severity" "critical" {
  name = var.incident_severity_name
}

# notification_rule is a raw JSON escape hatch (the provider's own docs
# don't enumerate its shape beyond "write it with jsonencode()") - this
# shape was confirmed against the actual OneUptime source (not guessed):
# packages/Common/Types/Workspace/NotificationRules/{BaseNotificationRule,
# NotificationRuleCondition,NotificationRuleTypes/IncidentNotificationRule,
# CreateChannelNotificationRule}.ts and matching server tests (e.g.
# RuleChannelArchivedByItsRule.test.ts), which is also what fills in the
# fields the provider docs don't mention: checkOn/conditionType/value use
# "Incident Severity"/"Contains Any"/[severityId], and several booleans
# on CreateChannelNotificationRule (shouldCreateNewChannel,
# shouldInviteOwnersToNewChannel, archiveChannelAutomatically) are required,
# not optional, whichever destination the rule uses.
#
# No top-level "_type" key here - confirmed live (tofu plan): the provider
# reserves "_type" as a generic marker for typed VALUES inside raw-JSON
# fields (e.g. "DateTime"), checked against its own small allow-list, not
# as a discriminator for which NotificationRule subtype this object is -
# "IncidentNotificationRule" (the app's own TS interface name) tripped that
# check ("Unknown OneUptime Type"). event_type/workspace_type already tell
# the server which kind of rule this is.
#
# OneUptime posts every update as its own channel message, never as a
# thread reply (its message payload has no thread field - confirmed in
# source and live: four updates of one incident had four different Slack
# timestamps). So the two destinations are used for two different jobs, as
# two instances of this module: an existing shared channel that gets only
# the updates worth a glance, and a channel per incident that holds the
# whole history and stands in for the thread.
resource "oneuptime_workspace_notification_rule" "this" {
  name        = var.name
  description = var.description

  event_type     = "Incident"
  workspace_type = "Slack"

  notification_rule = jsonencode({
    filterCondition = "All"
    filters = [
      {
        checkOn       = "Incident Severity"
        conditionType = "Contains Any"
        value         = [data.oneuptime_incident_severity.critical.id]
      },
    ]

    shouldPostToExistingChannel = var.slack_channel_name != ""
    existingChannelNames        = var.slack_channel_name

    shouldCreateNewChannel  = var.create_channel_per_incident
    newChannelTemplateName  = var.new_channel_prefix
    inviteTeamsToNewChannel = []
    # Plain id strings, not the {_type = "ObjectID", value = ...} form: the
    # server does `new ObjectID(userId.toString())` on each element
    # (WorkspaceNotificationRuleService.getUsersIdsToInviteToChannel), and a
    # wrapped object stringifies to "[object Object]". The invite then
    # fails, is logged and swallowed - confirmed live 2026-11-18: channel
    # inc-64 was created and nobody was invited.
    inviteUsersToNewChannel        = var.invite_user_ids
    shouldInviteOwnersToNewChannel = var.create_channel_per_incident
    archiveChannelAutomatically    = var.create_channel_per_incident

    shouldAutomaticallyInviteOnCallUsersToNewChannel = false

    # null means "every update"; a list posts only those after the first
    # message. An empty list would post nothing but the first message.
    updatesToPost = var.updates_to_post
  })
}
