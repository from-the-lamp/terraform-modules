variable "name" {
  type        = string
  description = "API key name shown in OneUptime, e.g. the consumer it belongs to."
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "Friendly description of what uses this key."
}

variable "expires_at" {
  type        = string
  description = "RFC 3339 time the key stops working."
}

variable "permissions" {
  type        = set(string)
  description = "OneUptime permission names granted to the key, e.g. \"ReadProjectIncident\"."
}

variable "vault_mount" {
  type        = string
  default     = "platform"
  description = "Vault KV-v2 mount the key value is written to."
}

variable "vault_secret_path" {
  type        = string
  default     = "oneuptime"
  description = "Secret path within vault_mount."
}

variable "vault_property" {
  type        = string
  description = "Property name the key value is written under at vault_mount/vault_secret_path."
}
