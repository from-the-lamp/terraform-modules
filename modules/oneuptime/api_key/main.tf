resource "oneuptime_api_key" "this" {
  name        = var.name
  description = var.description
  expires_at  = var.expires_at
}

resource "oneuptime_api_key_permission" "this" {
  for_each = var.permissions

  api_key_id = oneuptime_api_key.this.id
  permission = each.value
}

data "vault_kv_secret_v2" "existing" {
  mount = var.vault_mount
  name  = var.vault_secret_path
}

resource "vault_kv_secret_v2" "this" {
  mount = var.vault_mount
  name  = var.vault_secret_path
  data_json = jsonencode(merge(
    jsondecode(data.vault_kv_secret_v2.existing.data_json),
    { (var.vault_property) = oneuptime_api_key.this.api_key }
  ))
}
