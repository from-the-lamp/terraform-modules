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
| [oci_network_load_balancer_backend_set.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/network_load_balancer_backend_set) | resource |
| [oci_network_load_balancer_listener.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/network_load_balancer_listener) | resource |
| [oci_network_load_balancer_network_load_balancer.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/network_load_balancer_network_load_balancer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | The OCID of the compartment where the resource will be created. | `string` | n/a | yes |
| <a name="input_config_file_profile"></a> [config\_file\_profile](#input\_config\_file\_profile) | The profile name in the configuration file. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the resource. | `string` | `"default"` | no |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | A map of freeform tags to apply to the resource. | `map(string)` | <pre>{<br>  "provisioner": "terraform"<br>}</pre> | no |
| <a name="input_is_preserve_source_destination"></a> [is\_preserve\_source\_destination](#input\_is\_preserve\_source\_destination) | A flag indicating whether to preserve source and destination. | `bool` | `false` | no |
| <a name="input_is_private"></a> [is\_private](#input\_is\_private) | A flag indicating whether the resource is private. | `bool` | `false` | no |
| <a name="input_network_security_group_ids"></a> [network\_security\_group\_ids](#input\_network\_security\_group\_ids) | A list of Network Security Group (NSG) IDs to be associated with the resource. | `list(string)` | `[]` | no |
| <a name="input_nlb_ports"></a> [nlb\_ports](#input\_nlb\_ports) | A list of ports and protocols for the Network Load Balancer (NLB). | <pre>list(object({<br>    port     = number<br>    protocol = string<br>  }))</pre> | <pre>[<br>  {<br>    "port": 443,<br>    "protocol": "TCP"<br>  }<br>]</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet where the resource will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_set_names"></a> [backend\_set\_names](#output\_backend\_set\_names) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_ip"></a> [ip](#output\_ip) | n/a |
| <a name="output_ports"></a> [ports](#output\_ports) | n/a |
