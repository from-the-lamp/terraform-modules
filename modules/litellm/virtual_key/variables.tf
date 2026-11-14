variable "key_alias" {
  type        = string
  description = "litellm key_alias - the consumer this key belongs to."
}

variable "models" {
  type        = list(string)
  default     = []
  description = "Model names this key may call. Empty list means no restriction (all models)."
}

variable "max_budget" {
  type        = number
  default     = null
  description = "Spend ceiling in USD over budget_duration, before litellm blocks the key."
}

variable "budget_duration" {
  type        = string
  default     = null
  description = "Budget reset window, e.g. \"30d\"."
}

variable "vault_mount" {
  type        = string
  default     = "platform"
  description = "Vault KV-v2 mount the resulting key is written to."
}

variable "vault_secret_path" {
  type        = string
  description = "Secret path within vault_mount, e.g. \"litellm\"."
}

variable "vault_property" {
  type        = string
  description = "Property name the key value is written under at vault_mount/vault_secret_path, e.g. \"hindsight_api_key\"."
}
