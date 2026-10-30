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
| [oci_core_instance_pool.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/core_instance_pool) | resource |
| [oci_core_instance_pool_instances.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/data-sources/core_instance_pool_instances) | data source |
| [oci_identity_availability_domain.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/data-sources/identity_availability_domain) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_number"></a> [ad\_number](#input\_ad\_number) | n/a | `string` | n/a | yes |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | n/a | `string` | n/a | yes |
| <a name="input_config_file_profile"></a> [config\_file\_profile](#input\_config\_file\_profile) | n/a | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | n/a | `string` | n/a | yes |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | n/a | `map(string)` | <pre>{<br>  "provisioner": "terraform"<br>}</pre> | no |
| <a name="input_instance_configuration_id"></a> [instance\_configuration\_id](#input\_instance\_configuration\_id) | n/a | `string` | n/a | yes |
| <a name="input_primary_subnet_id"></a> [primary\_subnet\_id](#input\_primary\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | n/a | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | n/a |
