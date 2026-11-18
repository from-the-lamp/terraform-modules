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
