variable "name" {
  type    = string
  default = "Alertmanager"
}

variable "description" {
  type    = string
  default = "Receives Prometheus Alertmanager webhook notifications and opens/resolves one incident per alert fingerprint."
}

variable "incident_severity_name" {
  type    = string
  default = "Critical Incident"
}

variable "alert_severity_name" {
  type    = string
  default = "Warning"
}

variable "alert_severity_color" {
  type    = string
  default = "#f5a623"
}
