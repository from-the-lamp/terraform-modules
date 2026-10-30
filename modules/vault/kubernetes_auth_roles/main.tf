resource "vault_kubernetes_auth_backend_role" "template" {
  for_each = { for role in var.roles : role.role_name => role }

  backend                          = each.value.backend
  role_name                        = each.value.role_name
  bound_service_account_names      = each.value.service_account_names
  bound_service_account_namespaces = each.value.service_account_namespaces
  token_ttl                        = each.value.token_ttl
  token_max_ttl                    = each.value.token_max_ttl
  token_explicit_max_ttl           = each.value.token_explicit_max_ttl
  token_no_default_policy          = each.value.token_no_default_policy
  token_num_uses                   = each.value.token_num_uses
  token_policies                   = each.value.token_policies
  audience                         = each.value.audience
}
