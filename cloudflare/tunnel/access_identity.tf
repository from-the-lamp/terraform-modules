
resource "cloudflare_zero_trust_access_identity_provider" "zitadel" {
  count = var.enable_identity_provider_zitadel ? 1 : 0

  account_id = var.account_id
  name       = var.identity_provider_zitadel.name
  type       = "oidc"
  config {
    auth_url      = var.identity_provider_zitadel.auth_url
    token_url     = var.identity_provider_zitadel.token_url
    certs_url     = var.identity_provider_zitadel.certs_url
    client_id     = var.identity_provider_zitadel.client_id
    client_secret = var.identity_provider_zitadel.client_secret
    scopes        = var.identity_provider_zitadel.scopes
  }
}

resource "cloudflare_zero_trust_access_identity_provider" "gitlab" {
  count = var.enable_identity_provider_gitlab ? 1 : 0

  account_id = var.account_id
  name       = var.identity_provider_gitlab.name
  type       = "oidc"
  config {
    auth_url      = var.identity_provider_gitlab.auth_url
    token_url     = var.identity_provider_gitlab.token_url
    certs_url     = var.identity_provider_gitlab.certs_url
    client_id     = var.identity_provider_gitlab.client_id
    client_secret = var.identity_provider_gitlab.client_secret
    scopes        = var.identity_provider_gitlab.scopes
  }
}
