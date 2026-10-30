resource "oci_objectstorage_bucket" "template" {
  compartment_id = var.compartment_ocid
  name           = var.name
  namespace      = var.namespace
  access_type    = var.access_type
  versioning     = var.versioning
}
