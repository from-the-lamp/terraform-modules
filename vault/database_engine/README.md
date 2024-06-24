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
| [vault_database_secret_backend_connection.template](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/database_secret_backend_connection) | resource |
| [vault_mount.database](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_roles"></a> [allowed\_roles](#input\_allowed\_roles) | A list of roles that are allowed to access the database. | `list(string)` | <pre>[<br>  "value"<br>]</pre> | no |
| <a name="input_connection_url"></a> [connection\_url](#input\_connection\_url) | The URL for connecting to the database. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the database. | `string` | `"postgres"` | no |
| <a name="input_path"></a> [path](#input\_path) | The path within the database, typically used for namespace or schema. | `string` | `"postgres"` | no |
| <a name="input_root_password"></a> [root\_password](#input\_root\_password) | The root password for the database. | `string` | `""` | no |
| <a name="input_root_username"></a> [root\_username](#input\_root\_username) | The root username for the database. | `string` | `""` | no |

## Outputs

No outputs.
