resource "cloudflare_tunnel_config" "template" {
  count = var.create_tunnel_config ? 1 : 0

  account_id = var.account_id
  tunnel_id  = cloudflare_tunnel.template.id

  config {
    warp_routing {
      enabled = var.warp_routing
    }
    dynamic "ingress_rule" {
      for_each = var.ingress_rules
      content {
        hostname = lookup(ingress_rule.value, "hostname", null)
        path     = lookup(ingress_rule.value, "path", null)
        service  = lookup(ingress_rule.value, "service", null)
      }
    }
  }
}
