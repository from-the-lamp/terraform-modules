resource "oci_core_default_security_list" "template" {
  compartment_id             = var.compartment_ocid
  freeform_tags              = var.freeform_tags
  manage_default_resource_id = oci_core_vcn.template.default_security_list_id
  display_name               = "Default security list"
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
  ingress_security_rules {
    protocol    = "all"
    source      = var.oci_core_vcn_cidr
    description = "Allow all from vcn subnet"
  }
}
