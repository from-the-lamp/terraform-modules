resource "oneuptime_external_mcp_server" "this" {
  name        = var.name
  description = var.description
  url         = var.url
  auth_type   = var.auth_type
  is_enabled  = var.is_enabled

  bearer_token = var.auth_type == "BearerToken" ? var.bearer_token : null
  headers      = var.auth_type == "Headers" && var.headers != null ? jsonencode(var.headers) : null

  oauth_token_url     = var.auth_type == "OAuthClientCredentials" ? var.oauth_token_url : null
  oauth_client_id     = var.auth_type == "OAuthClientCredentials" ? var.oauth_client_id : null
  oauth_client_secret = var.auth_type == "OAuthClientCredentials" ? var.oauth_client_secret : null
  oauth_scope         = var.auth_type == "OAuthClientCredentials" ? var.oauth_scope : null
  oauth_audience      = var.auth_type == "OAuthClientCredentials" ? var.oauth_audience : null
}
