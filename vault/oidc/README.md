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
| [vault_identity_group.template](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/identity_group) | resource |
| [vault_identity_group_alias.template](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/identity_group_alias) | resource |
| [vault_jwt_auth_backend.template](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.template](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/jwt_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_redirect_uris"></a> [allowed\_redirect\_uris](#input\_allowed\_redirect\_uris) | A set of allowed redirect URIs for the OIDC role. | `set(string)` | n/a | yes |
| <a name="input_bound_audiences"></a> [bound\_audiences](#input\_bound\_audiences) | A list of audiences that the token must include. | `list(string)` | n/a | yes |
| <a name="input_bound_issuer"></a> [bound\_issuer](#input\_bound\_issuer) | The issuer of the tokens that this role will be bound to. | `string` | n/a | yes |
| <a name="input_groups_claim"></a> [groups\_claim](#input\_groups\_claim) | The claim in the token that maps to the user's groups. | `string` | `"groups"` | no |
| <a name="input_identity_groups"></a> [identity\_groups](#input\_identity\_groups) | A list of identity groups, each containing the identity name, type, and associated policies. | <pre>list(object({<br>    identity_name     = string<br>    identity_type     = string<br>    identity_policies = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | The client ID for the OpenID Connect (OIDC) application. | `string` | n/a | yes |
| <a name="input_oidc_client_secret"></a> [oidc\_client\_secret](#input\_oidc\_client\_secret) | The client secret for the OpenID Connect (OIDC) application. | `string` | n/a | yes |
| <a name="input_oidc_discovery_url"></a> [oidc\_discovery\_url](#input\_oidc\_discovery\_url) | The discovery URL for the OpenID Connect (OIDC) provider. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The path within the authentication provider configuration. | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The name of the role to be created. | `string` | `"default"` | no |
| <a name="input_role_type"></a> [role\_type](#input\_role\_type) | The type of role, typically set to 'oidc' for OpenID Connect roles. | `string` | `"oidc"` | no |
| <a name="input_user_claim"></a> [user\_claim](#input\_user\_claim) | The claim in the token that maps to the user. | `string` | `"sub"` | no |

## Outputs

No outputs.
