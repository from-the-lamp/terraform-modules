## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.32.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_access_identity_provider.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.32.0/docs/resources/access_identity_provider) | resource |
| [cloudflare_fallback_domain.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.32.0/docs/resources/fallback_domain) | resource |
| [cloudflare_split_tunnel.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.32.0/docs/resources/split_tunnel) | resource |
| [cloudflare_tunnel.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.32.0/docs/resources/tunnel) | resource |
| [cloudflare_tunnel_config.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.32.0/docs/resources/tunnel_config) | resource |
| [cloudflare_tunnel_route.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.32.0/docs/resources/tunnel_route) | resource |
| [cloudflare_tunnel_virtual_network.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.32.0/docs/resources/tunnel_virtual_network) | resource |
| [random_password.template](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_identity_client_id"></a> [access\_identity\_client\_id](#input\_access\_identity\_client\_id) | Identity client ID | `string` | n/a | yes |
| <a name="input_access_identity_client_secret"></a> [access\_identity\_client\_secret](#input\_access\_identity\_client\_secret) | Identity client Secret | `string` | n/a | yes |
| <a name="input_access_identity_tenant_id"></a> [access\_identity\_tenant\_id](#input\_access\_identity\_tenant\_id) | AzureAD tenant ID | `string` | n/a | yes |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The Cloudflare account ID or user zone ID | `string` | `null` | no |
| <a name="input_create_tunnel_config"></a> [create\_tunnel\_config](#input\_create\_tunnel\_config) | Flag to control the creation of the tunnel config | `bool` | `false` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules | `list(map(any))` | `[]` | no |
| <a name="input_private_dns_servers"></a> [private\_dns\_servers](#input\_private\_dns\_servers) | List of private DNS servers | `list(string)` | <pre>[<br>  "168.63.129.16"<br>]</pre> | no |
| <a name="input_private_domains"></a> [private\_domains](#input\_private\_domains) | List of private domains | <pre>list(object({<br>    suffix      = string<br>    description = string<br>  }))</pre> | n/a | yes |
| <a name="input_split_tunnels"></a> [split\_tunnels](#input\_split\_tunnels) | List of split tunnels | <pre>list(object({<br>    address     = optional(string)<br>    host        = optional(string)<br>    description = string<br>  }))</pre> | `[]` | no |
| <a name="input_tunnel_name"></a> [tunnel\_name](#input\_tunnel\_name) | The Cloudflare tunnel name | `string` | n/a | yes |
| <a name="input_tunnel_routes"></a> [tunnel\_routes](#input\_tunnel\_routes) | List of tunnel route configurations | <pre>list(object({<br>    network = string<br>    comment = string<br>  }))</pre> | `[]` | no |
| <a name="input_tunnel_secret"></a> [tunnel\_secret](#input\_tunnel\_secret) | The Cloudflare tunnel secret string | `string` | `null` | no |
| <a name="input_virtual_networks"></a> [virtual\_networks](#input\_virtual\_networks) | Map of virtual network configurations | <pre>map(object({<br>    account_id           = string<br>    virtual_network_name = string<br>    comment              = string<br>  }))</pre> | `{}` | no |
| <a name="input_warp_routing"></a> [warp\_routing](#input\_warp\_routing) | Is warp routing enabled | `bool` | `true` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Cloudflare zone ID or user account ID | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cname"></a> [cname](#output\_cname) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_token"></a> [token](#output\_token) | n/a |
