# sk- prefix is what litellm's own /key/generate uses for auto-generated
# keys - kept here so a predefined key is indistinguishable from one the
# proxy would have generated itself.
resource "random_password" "key" {
  length  = 32
  special = false
}

resource "litellm_key" "this" {
  key             = "sk-${random_password.key.result}"
  key_alias       = var.key_alias
  models          = var.models
  max_budget      = var.max_budget
  budget_duration = var.budget_duration
}

# Same one-level merge the vault/secrets_managed module does - read what's
# already at this path (master_key, provider API keys, other consumers'
# properties written by earlier applies of this same module) and only own
# var.vault_property, so this never clobbers sibling keys hand-written or
# owned by a different caller at the same secret path.
data "vault_kv_secret_v2" "existing" {
  mount = var.vault_mount
  name  = var.vault_secret_path
}

resource "vault_kv_secret_v2" "this" {
  mount = var.vault_mount
  name  = var.vault_secret_path
  data_json = jsonencode(merge(
    jsondecode(data.vault_kv_secret_v2.existing.data_json),
    { (var.vault_property) = litellm_key.this.key }
  ))
}
