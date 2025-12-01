resource "cloudflare_zero_trust_tunnel_cloudflared_config" "template" {
  count = var.create_tunnel_config ? 1 : 0

  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.template.id

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

resource "random_password" "template" {
  count  = var.tunnel_secret != null ? 0 : 1
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "template" {
  account_id = var.account_id
  name       = var.tunnel_name
  secret     = var.tunnel_secret != null ? base64encode(var.tunnel_secret) : base64encode(random_password.template[0].result)
}

resource "cloudflare_zero_trust_device_split_tunnel_rules" "template" {
  account_id = var.account_id
  mode       = "include"
  dynamic "tunnels" {
    for_each = var.split_tunnels
    content {
      address     = try(tunnels.value.address, null)
      host        = try(tunnels.value.host, null)
      description = tunnels.value.description
    }
  }
}