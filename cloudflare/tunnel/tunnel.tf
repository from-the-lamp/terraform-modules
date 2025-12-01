resource "cloudflare_zero_trust_tunnel_cloudflared_config" "template" {
  count = var.create_tunnel_config ? 1 : 0

  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.template.id

  config = {
    warp_routing = {
      enabled = var.warp_routing
    }
    ingress_rule = [
      for rule in var.ingress_rules : {
        hostname = lookup(rule, "hostname", null)
        path     = lookup(rule, "path", null)
        service  = lookup(rule, "service", null)
      }
    ]
  }
}

resource "random_password" "template" {
  count  = var.tunnel_secret != null ? 0 : 1
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "template" {
  account_id = var.account_id
  name       = var.tunnel_name
  tunnel_secret = var.tunnel_secret != null ? base64encode(var.tunnel_secret) : base64encode(random_password.template[0].result)
}

resource "cloudflare_zero_trust_device_default_profile" "template" {
  account_id = var.account_id
  service_mode_v2 {
    mode = "warp"
  }
  include = [
    for tunnel in var.split_tunnels : {
      address     = try(tunnel.address, null)
      host        = try(tunnel.host, null)
      description = tunnel.description
    }
  ]
}