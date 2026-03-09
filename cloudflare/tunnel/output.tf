output "id" {
  description = "The ID of the Cloudflare tunnel"
  value       = cloudflare_zero_trust_tunnel_cloudflared.template.id
}

output "cname" {
  description = "The CNAME record for routing traffic through the tunnel"
  value       = "${cloudflare_zero_trust_tunnel_cloudflared.template.id}.cfargotunnel.com"
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "template" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.template.id
}

output "token" {
  description = "The authentication token used to run the tunnel"
  value       = data.cloudflare_zero_trust_tunnel_cloudflared_token.template.token
  sensitive   = true
}
