resource "vault_kv_secret_v2" "template" {
  name      = var.secret_path
  mount     = var.path
  data_json = jsonencode(var.data)
  lifecycle {
    ignore_changes = [
      data_json,
    ]
  }
}
