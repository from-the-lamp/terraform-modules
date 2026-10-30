resource "cloudflare_zero_trust_tunnel_cloudflared_route" "template" {
  for_each = { for idx, route in var.tunnel_routes : idx => route }

  account_id         = var.account_id
  tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.template.id
  network            = each.value.network
  comment            = each.value.comment
  depends_on         = [cloudflare_zero_trust_tunnel_cloudflared.template]
}
