resource "vault_kubernetes_auth_backend_role" "template" {
  backend                          = var.backend_path
  role_name                        = var.role_name
  bound_service_account_names      = var.service_account_names
  bound_service_account_namespaces = var.service_account_namespaces
  token_ttl                        = var.token_ttl
  token_max_ttl                    = var.token_max_ttl
  token_explicit_max_ttl           = var.token_explicit_max_ttl
  token_no_default_policy          = var.token_no_default_policy
  token_num_uses                   = var.token_num_uses
  token_policies                   = var.token_policies
  audience                         = var.audience
}
