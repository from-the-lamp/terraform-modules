resource "tailscale_oauth_client" "template" {
  description = var.description
  scopes      = var.scopes
  tags        = var.tags
}
