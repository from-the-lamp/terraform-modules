resource "vault_policy" "template" {
  for_each = { for policy in var.policies : policy.policy_name => policy }

  name   = each.key
  policy = jsonencode({
    path = {
      (each.value.path) = {
        capabilities = each.value.capabilities
      }
    }
  })
}
