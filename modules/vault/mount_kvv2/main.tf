resource "vault_mount" "kvv2" {
  path = var.path
  type = "kv-v2"
  options = {
    version = "2"
    type    = "kv-v2"
  }
}
