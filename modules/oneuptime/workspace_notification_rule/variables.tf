variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "incident_severity_name" {
  type    = string
  default = "Critical Incident"
}

variable "slack_channel_name" {
  type        = string
  default     = ""
  description = "Existing Slack channel to post into (OneUptime's app must already be a member). Empty: the rule posts to no existing channel."
}

variable "create_channel_per_incident" {
  type        = bool
  default     = false
  description = "Create a Slack channel for every matching incident, invite its owners and the listed users, and archive it when the incident resolves."
}

variable "new_channel_prefix" {
  type        = string
  default     = ""
  description = "Prefix of the created channels: \"inc-\" names INC-42's channel inc-inc-42; empty names it inc-42."
}

variable "invite_user_ids" {
  type        = list(string)
  default     = []
  description = "OneUptime user IDs invited to every created channel. Each needs a Slack account connected in OneUptime."
}

variable "updates_to_post" {
  type        = list(string)
  default     = null
  description = "Updates posted after the first message; null posts every update."
}
