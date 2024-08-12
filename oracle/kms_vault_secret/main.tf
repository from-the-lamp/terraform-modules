resource "oci_vault_secret" "template" {
  for_each = var.secrets

  compartment_id = var.compartment_ocid
  vault_id       = var.vault_id
  key_id         = var.key_id
  secret_name    = each.key
  secret_content {
    content_type = "BASE64"
    content      = base64encode(each.value)
  }
}
