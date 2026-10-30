resource "oci_core_internet_gateway" "template" {
  count          = var.vcn_internet_gateway_enabled ? 1 : 0
  enabled        = true
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_internet_gateway_name
  vcn_id         = oci_core_vcn.template.id
  freeform_tags  = var.freeform_tags
}

resource "oci_core_default_route_table" "template" {
  count                      = var.vcn_internet_gateway_enabled ? 1 : 0
  manage_default_resource_id = oci_core_vcn.template.default_route_table_id
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.template[0].id
  }
}
