## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 5.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 5.13.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_zero_trust_access_identity_provider.gitlab](https://registry.terraform.io/providers/cloudflare/cloudflare/5.13.0/docs/resources/zero_trust_access_identity_provider) | resource |
| [cloudflare_zero_trust_access_identity_provider.zitadel](https://registry.terraform.io/providers/cloudflare/cloudflare/5.13.0/docs/resources/zero_trust_access_identity_provider) | resource |
| [cloudflare_zero_trust_device_default_profile.template](https://registry.terraform.io/providers/cloudflare/cloudflare/5.13.0/docs/resources/zero_trust_device_default_profile) | resource |
| [cloudflare_zero_trust_device_default_profile_local_domain_fallback.template](https://registry.terraform.io/providers/cloudflare/cloudflare/5.13.0/docs/resources/zero_trust_device_default_profile_local_domain_fallback) | resource |
| [cloudflare_zero_trust_tunnel_cloudflared.template](https://registry.terraform.io/providers/cloudflare/cloudflare/5.13.0/docs/resources/zero_trust_tunnel_cloudflared) | resource |
| [cloudflare_zero_trust_tunnel_cloudflared_config.template](https://registry.terraform.io/providers/cloudflare/cloudflare/5.13.0/docs/resources/zero_trust_tunnel_cloudflared_config) | resource |
| [cloudflare_zero_trust_tunnel_cloudflared_route.template](https://registry.terraform.io/providers/cloudflare/cloudflare/5.13.0/docs/resources/zero_trust_tunnel_cloudflared_route) | resource |
| [random_password.template](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [cloudflare_zero_trust_tunnel_cloudflared_token.template](https://registry.terraform.io/providers/cloudflare/cloudflare/5.13.0/docs/data-sources/zero_trust_tunnel_cloudflared_token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The Cloudflare account ID or user zone ID | `string` | `null` | no |
| <a name="input_create_tunnel_config"></a> [create\_tunnel\_config](#input\_create\_tunnel\_config) | Flag to control the creation of the tunnel config | `bool` | `false` | no |
| <a name="input_enable_identity_provider_gitlab"></a> [enable\_identity\_provider\_gitlab](#input\_enable\_identity\_provider\_gitlab) | Enable or disable the creation of the identity provider resource | `bool` | `false` | no |
| <a name="input_enable_identity_provider_zitadel"></a> [enable\_identity\_provider\_zitadel](#input\_enable\_identity\_provider\_zitadel) | Enable or disable the creation of the identity provider resource | `bool` | `false` | no |
| <a name="input_identity_provider_gitlab"></a> [identity\_provider\_gitlab](#input\_identity\_provider\_gitlab) | OIDC configuration for GitLab identity provider | <pre>object({<br>    name          = string<br>    auth_url      = string<br>    token_url     = string<br>    certs_url     = string<br>    client_id     = string<br>    client_secret = string<br>    scopes        = list(string)<br>  })</pre> | See variables.tf | no |
| <a name="input_identity_provider_zitadel"></a> [identity\_provider\_zitadel](#input\_identity\_provider\_zitadel) | OIDC configuration for Zitadel identity provider | <pre>object({<br>    name          = string<br>    auth_url      = string<br>    token_url     = string<br>    certs_url     = string<br>    client_id     = string<br>    client_secret = string<br>    scopes        = list(string)<br>  })</pre> | See variables.tf | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules | `list(map(any))` | `[]` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | App secrets key-vault ID | `string` | `null` | no |
| <a name="input_private_domains"></a> [private\_domains](#input\_private\_domains) | List of private domains | <pre>list(object({<br>    suffix      = string<br>    description = string<br>    dns_servers = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_split_tunnels"></a> [split\_tunnels](#input\_split\_tunnels) | List of split tunnels | <pre>list(object({<br>    address     = optional(string)<br>    host        = optional(string)<br>    description = string<br>  }))</pre> | `[]` | no |
| <a name="input_store_secrets_in_key_vault"></a> [store\_secrets\_in\_key\_vault](#input\_store\_secrets\_in\_key\_vault) | Put secrets to key vault | `bool` | `false` | no |
| <a name="input_tunnel_name"></a> [tunnel\_name](#input\_tunnel\_name) | The Cloudflare tunnel name | `string` | n/a | yes |
| <a name="input_tunnel_routes"></a> [tunnel\_routes](#input\_tunnel\_routes) | List of tunnel route configurations | <pre>list(object({<br>    network = string<br>    comment = string<br>  }))</pre> | `[]` | no |
| <a name="input_tunnel_secret"></a> [tunnel\_secret](#input\_tunnel\_secret) | The Cloudflare tunnel secret string | `string` | `null` | no |
| <a name="input_warp_routing"></a> [warp\_routing](#input\_warp\_routing) | Is warp routing enabled | `bool` | `true` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Cloudflare zone ID or user account ID | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cname"></a> [cname](#output\_cname) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_token"></a> [token](#output\_token) | n/a |
