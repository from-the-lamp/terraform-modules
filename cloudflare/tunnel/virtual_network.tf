resource "cloudflare_tunnel_virtual_network" "template" {
  for_each = var.virtual_networks

  account_id = each.value.account_id
  name       = each.value.virtual_network_name
  comment    = each.value.comment
}
