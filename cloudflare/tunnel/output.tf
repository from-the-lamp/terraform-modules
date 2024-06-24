output "id" {
  value = cloudflare_tunnel.template.id
}

output "cname" {
  value = cloudflare_tunnel.template.cname
}

output "token" {
  value     = cloudflare_tunnel.template.tunnel_token
  sensitive = true
}
