## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 4.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_kubernetes_auth_backend_role.template](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/kubernetes_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_roles"></a> [roles](#input\_roles) | n/a | <pre>list(object({<br>    backend                    = string<br>    role_name                  = string<br>    service_account_names      = list(string)<br>    service_account_namespaces = list(string)<br>    token_ttl                  = optional(number)<br>    token_max_ttl              = optional(number)<br>    token_explicit_max_ttl     = optional(number)<br>    token_no_default_policy    = optional(bool)<br>    token_num_uses             = optional(number)<br>    token_policies             = optional(list(string))<br>    audience                   = optional(string)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
