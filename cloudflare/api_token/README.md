## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_api_token.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.35.0/docs/resources/api_token) | resource |
| [cloudflare_api_token_permission_groups.all](https://registry.terraform.io/providers/cloudflare/cloudflare/4.35.0/docs/data-sources/api_token_permission_groups) | data source |
| [cloudflare_zone.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.35.0/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_token_name"></a> [cloudflare\_token\_name](#input\_cloudflare\_token\_name) | Cloudflare Token name | `string` | n/a | yes |
| <a name="input_cloudflare_zone_name"></a> [cloudflare\_zone\_name](#input\_cloudflare\_zone\_name) | Cloudflare Zone name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudflare_api_token"></a> [cloudflare\_api\_token](#output\_cloudflare\_api\_token) | n/a |
