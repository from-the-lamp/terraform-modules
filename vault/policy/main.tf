resource "vault_policy" "template" {
  name   = var.policy_name
  policy = jsonencode({
    path = {
      for p in var.policy_value : p.path => {
        capabilities = p.capabilities
      }
    }
  })
}
