## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 6.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 6.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_kms_key.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/kms_key) | resource |
| [oci_kms_vault.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/kms_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | The OCID of the compartment where the resource will be created. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the resource. | `string` | n/a | yes |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | n/a | `string` | `"AES"` | no |
| <a name="input_key_length"></a> [key\_length](#input\_key\_length) | n/a | `number` | `16` | no |
| <a name="input_vault_type"></a> [vault\_type](#input\_vault\_type) | n/a | `string` | `"DEFAULT"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_vault_id"></a> [vault\_id](#output\_vault\_id) | n/a |
