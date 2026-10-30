resource "oci_identity_customer_secret_key" "template" {
  display_name = var.name
  user_id      = var.user_id
}
