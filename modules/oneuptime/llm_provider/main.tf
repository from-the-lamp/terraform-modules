data "vault_kv_secret_v2" "litellm_key" {
  mount = var.litellm_vault_mount
  name  = var.litellm_vault_secret_path
}

resource "oneuptime_llm_provider" "this" {
  name        = var.name
  description = var.description
  llm_type    = "OpenAICompatible"
  base_url    = var.base_url
  api_key     = data.vault_kv_secret_v2.litellm_key.data[var.litellm_vault_property]
  model_name  = var.model_name
  is_default  = var.is_default
}
