output "client_id" {
  description = "The OAuth client ID"
  value       = tailscale_oauth_client.template.id
}

output "client_secret" {
  description = "The OAuth client secret"
  value       = tailscale_oauth_client.template.key
  sensitive   = true
}
