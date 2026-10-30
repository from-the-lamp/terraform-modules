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
| [vault_auth_backend.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/auth_backend) | resource |
| [vault_kubernetes_auth_backend_config.template](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/kubernetes_auth_backend_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_path"></a> [path](#input\_path) | Path in Vault | `string` | `"kubernetes"` | no |

## Outputs

No outputs.
