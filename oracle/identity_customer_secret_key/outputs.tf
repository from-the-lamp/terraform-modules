output "secret_key" {
  value     = oci_identity_customer_secret_key.template.id
  sensitive = true
}

output "access_key" {
  value     = oci_identity_customer_secret_key.template.key
  sensitive = true
}

output "ocid" {
  value     = oci_identity_customer_secret_key.template.user_id
  sensitive = true
}

output "state" {
  value = oci_identity_customer_secret_key.template.state
}

output "name" {
  value = oci_identity_customer_secret_key.template.display_name
}
