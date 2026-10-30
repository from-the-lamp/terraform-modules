resource "oci_kms_vault" "template" {
  compartment_id = var.compartment_ocid
  display_name   = var.display_name
  vault_type     = var.vault_type
}

resource "oci_kms_key" "template" {
  compartment_id      = var.compartment_ocid
  display_name        = "${var.display_name}-key"
  management_endpoint = oci_kms_vault.template.management_endpoint
  key_shape {
    algorithm = "AES"
    length    = 16
  }
}
