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
| [vault_policy.template](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policies"></a> [policies](#input\_policies) | n/a | <pre>list(object({<br>    policy_name  = string<br>    path         = string<br>    capabilities = list(string)<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
