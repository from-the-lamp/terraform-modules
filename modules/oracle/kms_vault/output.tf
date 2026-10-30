output "name" {
  value = oci_kms_vault.template.display_name
}

output "vault_id" {
  value = oci_kms_vault.template.id
}

output "key_id" {
  value = oci_kms_key.template.id
}
