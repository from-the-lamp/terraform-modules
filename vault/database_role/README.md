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
| [vault_database_secret_backend_role.role](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/database_secret_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_path"></a> [backend\_path](#input\_backend\_path) | n/a | `string` | `"postgres"` | no |
| <a name="input_creation_statements"></a> [creation\_statements](#input\_creation\_statements) | n/a | `list(string)` | `[]` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
