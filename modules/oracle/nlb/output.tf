output "id" {
  value = oci_network_load_balancer_network_load_balancer.template.id
}

output "backend_set_names" {
  value = oci_network_load_balancer_backend_set.template[*].name  
}

output "ports" {
  value = var.nlb_ports
}

output "ip" {
  value = oci_network_load_balancer_network_load_balancer.template.ip_addresses[0].ip_address
}
