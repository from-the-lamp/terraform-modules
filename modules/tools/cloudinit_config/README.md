## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | 2.3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | 2.3.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudinit_config.template](https://registry.terraform.io/providers/hashicorp/cloudinit/2.3.4/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base64_encode"></a> [base64\_encode](#input\_base64\_encode) | Whether to Base64 encode the content. | `bool` | `true` | no |
| <a name="input_content"></a> [content](#input\_content) | The content to be processed, typically a script or configuration. | `string` | n/a | yes |
| <a name="input_content_type"></a> [content\_type](#input\_content\_type) | The MIME type of the content. | `string` | `"text/x-shellscript"` | no |
| <a name="input_gzip"></a> [gzip](#input\_gzip) | Whether to gzip the content. | `bool` | `true` | no |
| <a name="input_vars"></a> [vars](#input\_vars) | A map of variables to be substituted into the content. | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config"></a> [config](#output\_config) | n/a |
