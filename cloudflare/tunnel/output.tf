output "id" {
  value = cloudflare_zero_trust_tunnel_cloudflared.template.id
}

output "cname" {
  value = "${cloudflare_zero_trust_tunnel_cloudflared.template.id}.cfargotunnel.com"
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "template" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.template.id
}

output "token" {
  value     = data.cloudflare_zero_trust_tunnel_cloudflared_token.template.token
  sensitive = true
}
