resource "oci_identity_dynamic_group" "template" {
  compartment_id = var.compartment_ocid
  name           = var.name
  description    = "Dynamic group which contains all instance in this compartment"
  matching_rule  = "All {instance.compartment.id = '${var.compartment_ocid}'}"
}

resource "oci_identity_policy" "template" {
  compartment_id = var.compartment_ocid
  name           = var.name
  description    = "Allow dynamic group ${oci_identity_dynamic_group.template.name} in the compartment"
  statements = [
    "allow dynamic-group ${oci_identity_dynamic_group.template.name} to read instance-family in compartment id ${var.compartment_ocid}",
    "allow dynamic-group ${oci_identity_dynamic_group.template.name} to use virtual-network-family in compartment id ${var.compartment_ocid}",
    "allow dynamic-group ${oci_identity_dynamic_group.template.name} to manage load-balancers in compartment id ${var.compartment_ocid}",
    "allow dynamic-group ${oci_identity_dynamic_group.template.name} to manage security-lists in compartment id ${var.compartment_ocid}",
    "allow dynamic-group ${oci_identity_dynamic_group.template.name} to use private-ips in compartment id ${var.compartment_ocid}",
    "allow dynamic-group ${oci_identity_dynamic_group.template.name} to manage public-ips in compartment id ${var.compartment_ocid}"
  ]
}
