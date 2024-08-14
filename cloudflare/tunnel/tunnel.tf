resource "random_password" "template" {
  count  = var.tunnel_secret != null ? 0 : 1
  length = 64
}

resource "cloudflare_tunnel" "template" {
  account_id = var.account_id
  name       = var.tunnel_name
  secret     = var.tunnel_secret != null ? base64encode(var.tunnel_secret) : base64encode(random_password.template[0].result)
}

resource "cloudflare_split_tunnel" "template" {
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
  depends_on = [cloudflare_tunnel_route.template]
}

resource "cloudflare_fallback_domain" "template" {
  count      = length(var.private_domains) > 0 ? 1 : 0
  account_id = var.account_id
  dynamic "domains" {
    for_each = var.private_domains
    content {
      suffix      = domains.value.suffix
      description = domains.value.description
      dns_server  = domains.value.dns_servers
    }
  }
}
