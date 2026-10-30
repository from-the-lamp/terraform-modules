resource "vault_jwt_auth_backend" "template" {
  path               = var.path
  bound_issuer       = var.bound_issuer
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  oidc_discovery_url = var.oidc_discovery_url
  default_role       = var.role_name
  tune {
    listing_visibility = "unauth"
  }
}

resource "vault_jwt_auth_backend_role" "template" {
  role_name             = var.role_name
  user_claim            = var.user_claim
  role_type             = var.role_type
  backend               = vault_jwt_auth_backend.template.path
  allowed_redirect_uris = var.allowed_redirect_uris
  bound_audiences       = var.bound_audiences
  groups_claim          = var.groups_claim
}

resource "vault_identity_group" "template" {
  for_each = { for idx, val in var.identity_groups : idx => val }
  name     = each.value.identity_name
  type     = each.value.identity_type
  policies = each.value.identity_policies
}

resource "vault_identity_group_alias" "template" {
  for_each       = { for idx, val in var.identity_groups : idx => val }
  name           = each.value.identity_name
  mount_accessor = vault_jwt_auth_backend.template.accessor
  canonical_id   = vault_identity_group.template[each.key].id
}
