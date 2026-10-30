data "oci_core_instance_pool_instances" "template" {
  compartment_id   = var.compartment_ocid
  instance_pool_id = oci_core_instance_pool.template.id
}

output "instance_ids" {
  value = [for i in data.oci_core_instance_pool_instances.template.instances : i.id]
}
