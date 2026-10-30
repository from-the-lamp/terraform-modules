data "oci_identity_availability_domain" "template" {
  compartment_id = var.compartment_ocid
  ad_number      = var.ad_number
}

resource "oci_core_instance_pool" "template" {
  compartment_id            = var.compartment_ocid
  freeform_tags             = var.freeform_tags
  display_name              = var.display_name
  size                      = var.size
  instance_configuration_id = var.instance_configuration_id
  placement_configurations {
    availability_domain = data.oci_identity_availability_domain.template.name
    primary_subnet_id   = var.primary_subnet_id
  }
}
