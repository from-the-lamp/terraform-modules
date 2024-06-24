## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 5.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_network_load_balancer_backend.template](https://registry.terraform.io/providers/oracle/oci/5.46.0/docs/resources/network_load_balancer_backend) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_set_name"></a> [backend\_set\_name](#input\_backend\_set\_name) | The name of the backend set. | `string` | n/a | yes |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | The OCID of the compartment where the resource will be created. | `string` | n/a | yes |
| <a name="input_config_file_profile"></a> [config\_file\_profile](#input\_config\_file\_profile) | The profile name in the configuration file. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the resource. | `string` | n/a | yes |
| <a name="input_nlb_id"></a> [nlb\_id](#input\_nlb\_id) | The ID of the Network Load Balancer (NLB). | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | The port number for the backend set. | `number` | `443` | no |
| <a name="input_target_ids"></a> [target\_ids](#input\_target\_ids) | A list of target IDs to be included in the backend set. | `list(string)` | n/a | yes |

## Outputs

No outputs.
