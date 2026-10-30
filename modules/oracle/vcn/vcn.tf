resource "oci_core_vcn" "template" {
  cidr_block     = var.oci_core_vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_name
  dns_label      = var.vcn_dns_label
  freeform_tags  = var.freeform_tags
}