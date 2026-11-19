variable "project_id" {
  type        = string
  description = "ID of the existing OneUptime project to adopt. The project is imported, never created."
}

variable "name" {
  type = string
}

variable "enable_automatic_incident_investigation" {
  type    = bool
  default = false
}

variable "enable_automatic_alert_investigation" {
  type    = bool
  default = false
}

variable "enable_automatic_postmortem_draft" {
  type    = bool
  default = false
}

variable "enable_automatic_incident_remediation" {
  type        = bool
  default     = false
  description = "OneUptime AI attempts fixes for new incidents. Nothing opens without a connected repository and a Runner."
}

variable "enable_automatic_alert_remediation" {
  type        = bool
  default     = false
  description = "OneUptime AI attempts fixes for new alerts."
}

variable "ai_context" {
  type        = string
  default     = null
  description = "Project-wide Markdown notes placed at the start of OneUptime AI's system prompt, at most 20000 characters. No secrets."
}

variable "ai_daily_token_limit" {
  type        = number
  default     = null
  description = "Project-wide cap on tokens per UTC day across all AI features. Unset means no limit."
}

variable "ai_run_time_limit_in_minutes" {
  type        = number
  default     = null
  description = "Limit for any single AI run. Unset means OneUptime's default of 120 minutes."
}

variable "incident_ai_max_concurrent_investigations" {
  type        = number
  default     = null
  description = "Unset means no limit."
}

variable "alert_ai_max_concurrent_investigations" {
  type        = number
  default     = null
  description = "Unset means no limit."
}

variable "incident_investigation_dedupe_window_minutes" {
  type        = number
  default     = null
  description = "Repeat incidents affecting the same monitor within this window are not re-investigated. Maximum 1440."
}

variable "alert_investigation_dedupe_window_minutes" {
  type        = number
  default     = null
  description = "Repeat alerts from the same monitor within this window are not re-investigated. Maximum 1440."
}

variable "incident_ai_daily_fix_task_limit" {
  type        = number
  default     = null
  description = "Maximum incident-derived AI fix tasks per UTC day. Unset means no limit, 0 pauses fix tasks."
}

variable "alert_ai_daily_fix_task_limit" {
  type        = number
  default     = null
  description = "Maximum alert-derived AI fix tasks per UTC day. Unset means no limit, 0 pauses fix tasks."
}
