output "vcn_id" {
  value = oci_core_vcn.template.id
}

output "vcn_cidr" {
  value = var.oci_core_vcn_cidr
}

output "default_security_list_id" {
  value = oci_core_vcn.template.default_security_list_id
}

output "subnets_ids" {
  description = "Mapping of subnet names to their OCIDs"
  value       = { for s in oci_core_subnet.template : s.display_name => s.id }
}
