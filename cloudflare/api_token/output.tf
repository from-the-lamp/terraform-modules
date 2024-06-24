output "cloudflare_api_token" {
  value     = cloudflare_api_token.template.value
  sensitive = true
}
