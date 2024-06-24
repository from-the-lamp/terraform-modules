resource "oci_network_load_balancer_backend" "template" {
  count                    = length(var.target_ids)
  name                     = "${var.display_name}-${var.port}-${count.index}"
  backend_set_name         = var.backend_set_name
  network_load_balancer_id = var.nlb_id
  port                     = var.port
  target_id                = var.target_ids[count.index]
}
