resource "oci_core_subnet" "template" {
  for_each          = var.vcn_subnets
  compartment_id    = var.compartment_ocid
  cidr_block        = each.value.cidr_block
  display_name      = each.key
  dns_label         = each.value.dns_label
  route_table_id    = oci_core_vcn.template.default_route_table_id
  vcn_id            = oci_core_vcn.template.id
  security_list_ids = [oci_core_default_security_list.template.id]
  freeform_tags     = var.freeform_tags
}
