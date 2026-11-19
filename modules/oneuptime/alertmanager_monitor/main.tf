data "oneuptime_monitor_status" "offline" {
  name = "Offline"
}

data "oneuptime_monitor_status" "operational" {
  name = "Operational"
}

data "oneuptime_incident_severity" "critical" {
  name = var.incident_severity_name
}

# A fresh OneUptime project ships with "High"/"Low" alert severities only - no
# "Warning" exists to look up, so it's Terraform-managed here rather than
# created once by hand in the UI, matching the incident_severity convention
# above.
resource "oneuptime_alert_severity" "warning" {
  name        = var.alert_severity_name
  color       = var.alert_severity_color
  description = "Prometheus Alertmanager alerts at warning severity - visible, not paged."
}

locals {
  # Every criteria instance below is evaluated independently against each
  # incoming webhook - OneUptime does NOT stop at the first match. Confirmed
  # live, the hard way: with js_fallback left as a bare `alerts.length > 0`
  # (no severity exclusion), an ordinary warning-severity alert matched BOTH
  # "Warning - Firing" (createAlerts) AND "Fallback - unknown severity"
  # (createIncidents, Critical) on the SAME webhook - that's what turned a
  # routine KubeContainerOOMKilled into a spurious Critical Incident. So
  # js_fallback below must positively exclude every severity already
  # handled by its own criteria, not just rely on ordering. Alertmanager's
  # own group_by now includes `severity` (lamp-victoria-metrics'
  # vmalertmanager-config.yaml), which guarantees every webhook batch holds
  # alerts of a single severity value, so `commonLabels.severity` alone is
  # trustworthy here without inspecting every alert in the body.
  #
  # Each severity gets its own Firing/Resolved pair rather than one shared
  # pair, because the previous single-pair design had a real bug: only the
  # "Firing" criteria carried `incident_grouping`, so a webhook containing
  # ONLY resolved alerts (a fully-recovered group, nothing else firing)
  # matched "Resolved" instead, which had no grouping/resolution logic at
  # all - the corresponding incident never auto-closed. Fixed here by giving
  # every Firing/Resolved pair identical `incident_grouping` JSON, so
  # whichever one wins still resolves the right fingerprint.
  #
  # Matching also moved from a plain substring check (`Contains
  # "status":"firing"`, which also matches when that text merely appears
  # inside an unrelated field) to a JavaScript Expression that actually
  # parses the body and checks the real `alerts[]`/`commonLabels` structure.
  incident_grouping_json = jsonencode({
    groupByJSONPath      = "requestBody.alerts[*].fingerprint"
    resolvedWhenJSONPath = "requestBody.alerts[*].status"
    resolvedWhenValue    = "resolved"
  })

  # Templates have no conditionals and leave a missing path as written, so
  # only fields every alert carries are used: alertname, severity and
  # cluster are always there (cluster is vmagent's external label), summary
  # and description on every rule that defines them. instance and namespace
  # are not (cluster-wide alerts have neither), so they stay out of the
  # title. The oneuptime Alertmanager route sends one alert per webhook
  # (group_by ['...']), which is what makes commonAnnotations and alerts[0]
  # mean "this alert" rather than "whatever the batch happens to share".
  incident_title = "{{requestBody.commonLabels.alertname}} ({{requestBody.commonLabels.cluster}})"

  # No custom description template: the body is exactly the Alertmanager
  # rule's own annotations.description, unformatted - OneUptime's own
  # Incident/Alert card already renders severity/state/fingerprint/buttons
  # around it, so this is the bare default look, not a design of ours.
  description = "{{requestBody.commonAnnotations.description}}"

  # OneUptime does not expose `requestBody` as a variable: it replaces every
  # {{placeholder}} with the value as TEXT and then runs the result
  # (docs: monitor/javascript-expression.md). The first version of these
  # referenced a bare `requestBody`, threw a ReferenceError on every request
  # and so never matched - confirmed live 2026-11-18, no incident was
  # created after the apply. Strings are quoted, arrays are left bare and
  # indexed. A missing path is left as written: for the quoted severity that
  # is just a non-matching string, which is what sends an unlabeled batch to
  # the fallback criteria.
  js_firing = {
    for s in ["critical", "warning"] : s =>
    "\"{{requestBody.commonLabels.severity}}\" === \"${s}\" && {{requestBody.alerts}}.some(function(a){return a.status === \"firing\";})"
  }

  js_resolved = {
    for s in ["critical", "warning"] : s =>
    "\"{{requestBody.commonLabels.severity}}\" === \"${s}\" && {{requestBody.alerts}}.length > 0 && {{requestBody.alerts}}.every(function(a){return a.status === \"resolved\";})"
  }

  js_fallback = "\"{{requestBody.commonLabels.severity}}\" !== \"critical\" && \"{{requestBody.commonLabels.severity}}\" !== \"warning\" && {{requestBody.alerts}}.length > 0"
}

resource "oneuptime_monitor" "this" {
  name        = var.name
  description = var.description

  monitor_type = "Incoming Request"

  monitor_steps = [{
    criteria = [
      {
        name        = "Critical - Firing"
        description = "At least one critical-severity alert in this batch is firing"

        filter_condition      = "All"
        change_monitor_status = true
        monitor_status_id     = data.oneuptime_monitor_status.offline.id
        create_incidents      = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_firing["critical"]
          },
        ]

        incident_grouping = local.incident_grouping_json

        incidents = [{
          title                 = local.incident_title
          description           = local.description
          incident_severity_id  = data.oneuptime_incident_severity.critical.id
          auto_resolve_incident = true
        }]
      },
      {
        name        = "Critical - Resolved"
        description = "Every alert in this critical-severity batch has resolved"

        filter_condition      = "All"
        change_monitor_status = true
        monitor_status_id     = data.oneuptime_monitor_status.operational.id
        create_incidents      = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_resolved["critical"]
          },
        ]

        incident_grouping = local.incident_grouping_json

        incidents = [{
          title                 = local.incident_title
          description           = local.description
          incident_severity_id  = data.oneuptime_incident_severity.critical.id
          auto_resolve_incident = true
        }]
      },
      {
        name        = "Warning - Firing"
        description = "At least one warning-severity alert in this batch is firing"

        filter_condition      = "All"
        change_monitor_status = true
        monitor_status_id     = data.oneuptime_monitor_status.offline.id
        create_alerts         = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_firing["warning"]
          },
        ]

        incident_grouping = local.incident_grouping_json

        alerts = [{
          title              = local.incident_title
          description        = local.description
          alert_severity_id  = oneuptime_alert_severity.warning.id
          auto_resolve_alert = true
        }]
      },
      {
        name        = "Warning - Resolved"
        description = "Every alert in this warning-severity batch has resolved"

        filter_condition      = "All"
        change_monitor_status = true
        monitor_status_id     = data.oneuptime_monitor_status.operational.id
        create_alerts         = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_resolved["warning"]
          },
        ]

        incident_grouping = local.incident_grouping_json

        alerts = [{
          title              = local.incident_title
          description        = local.description
          alert_severity_id  = oneuptime_alert_severity.warning.id
          auto_resolve_alert = true
        }]
      },
      {
        # Catches anything that didn't match a known severity above (missing
        # or unexpected `severity` label) - TZ requirement: unknown alerts
        # must land somewhere controlled, never be silently dropped. Treated
        # as critical since "unknown severity" is itself worth a human look.
        name        = "Fallback - unknown severity"
        description = "Alertmanager batch with no recognized severity label"

        filter_condition = "All"
        create_incidents = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_fallback
          },
        ]

        incident_grouping = local.incident_grouping_json

        incidents = [{
          title                 = "Unrecognized-severity alert: ${local.incident_title}"
          description           = local.description
          incident_severity_id  = data.oneuptime_incident_severity.critical.id
          auto_resolve_incident = true
        }]
      },
    ]
  }]
}
