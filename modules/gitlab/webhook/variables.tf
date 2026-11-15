variable "project" {
  type        = string
  description = "The ID or full path of the project this webhook is created on (e.g. \"from-the-lamp/infra/helm-charts\")."
}

variable "url" {
  type        = string
  description = "URL GitLab sends the webhook's events to."
}

variable "pipeline_events" {
  type        = bool
  default     = true
  description = "Whether to send pipeline events to url."
}

variable "enable_ssl_verification" {
  type        = bool
  default     = true
  description = "Whether GitLab verifies this webhook endpoint's TLS certificate before sending events."
}

variable "vault_mount" {
  type        = string
  default     = "platform"
  description = "Vault KV-v2 mount the webhook token is read from."
}

variable "vault_secret_path" {
  type        = string
  description = "Secret path within vault_mount holding the webhook token, e.g. \"gitlab\"."
}

variable "vault_property" {
  type        = string
  description = "Property name within vault_mount/vault_secret_path holding the webhook token."
}
