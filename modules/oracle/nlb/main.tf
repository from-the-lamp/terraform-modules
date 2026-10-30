resource "oci_network_load_balancer_network_load_balancer" "template" {
  compartment_id                 = var.compartment_ocid
  subnet_id                      = var.subnet_id
  display_name                   = var.display_name
  is_private                     = var.is_private
  is_preserve_source_destination = var.is_preserve_source_destination
  network_security_group_ids     = var.network_security_group_ids
}

resource "oci_network_load_balancer_backend_set" "template" {
  count                    = length(var.nlb_ports)
  name                     = "${var.display_name}-${var.nlb_ports[count.index].port}"
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.template.id
  policy                   = "FIVE_TUPLE"
  is_preserve_source       = true
  health_checker {
    protocol = var.nlb_ports[count.index].protocol
    port     = var.nlb_ports[count.index].port
  }
}

resource "oci_network_load_balancer_listener" "template" {
  count                    = length(var.nlb_ports)
  name                     = "${var.display_name}-${var.nlb_ports[count.index].port}"
  default_backend_set_name = oci_network_load_balancer_backend_set.template[count.index].name
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.template.id
  port                     = var.nlb_ports[count.index].port
  protocol                 = var.nlb_ports[count.index].protocol
}
