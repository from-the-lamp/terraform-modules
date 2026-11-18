variable "name" {
  type    = string
  default = "LiteLLM (from-the-lamp)"
}

variable "description" {
  type    = string
  default = "OpenAI-compatible LiteLLM gateway, homelab"
}

variable "base_url" {
  type    = string
  default = "https://litellm.from-the-lamp.work/v1"
}

variable "litellm_vault_mount" {
  type    = string
  default = "platform"
}

variable "litellm_vault_secret_path" {
  type    = string
  default = "litellm"
}

variable "litellm_vault_property" {
  type    = string
  default = "oneuptime_api_key"
}

variable "model_name" {
  type    = string
  default = "claude-sonnet-5"
}

variable "is_default" {
  type    = bool
  default = true
}
