output "id" {
  value = cloudflare_zero_trust_tunnel_cloudflared.template.id
}

output "cname" {
  value = "${cloudflare_zero_trust_tunnel_cloudflared.template.id}.cfargotunnel.com"
}

# output "token" {
#   value     = cloudflare_zero_trust_tunnel_cloudflared.template.tunnel_token
#   sensitive = true
# }
