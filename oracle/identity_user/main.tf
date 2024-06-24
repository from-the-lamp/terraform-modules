resource "oci_identity_user" "template" {
  name           = var.username
  compartment_id = var.compartment_ocid
  description    = var.description
}

resource "oci_identity_group" "template" {
  name           = var.username
  compartment_id = var.compartment_ocid
  description    = var.description
}

resource "oci_identity_user_group_membership" "template" {
  compartment_id = var.compartment_ocid
  user_id        = oci_identity_user.template.id
  group_id       = oci_identity_group.template.id
}

resource "oci_identity_policy" "template" {
  name           = "template"
  description    = "Policy with full permissions"
  compartment_id = var.compartment_ocid
  statements = [
    "Allow group ${oci_identity_group.template.name} to manage all-resources in tenancy",
  ]
}
