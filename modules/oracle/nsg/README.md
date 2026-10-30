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
| [oci_core_network_security_group.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/core_network_security_group) | resource |
| [oci_core_network_security_group_security_rule.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/core_network_security_group_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | The OCID of the compartment where the resource will be created. | `string` | n/a | yes |
| <a name="input_config_file_profile"></a> [config\_file\_profile](#input\_config\_file\_profile) | The profile name in the configuration file. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the resource | `string` | `"default"` | no |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | A map of freeform tags to apply to the resource. | `map(string)` | <pre>{<br>  "provisioner": "terraform"<br>}</pre> | no |
| <a name="input_rule_direction"></a> [rule\_direction](#input\_rule\_direction) | The direction of the rule | `string` | `"INGRESS"` | no |
| <a name="input_rule_protocol"></a> [rule\_protocol](#input\_rule\_protocol) | The protocol number for the rule. | `number` | `6` | no |
| <a name="input_rule_source"></a> [rule\_source](#input\_rule\_source) | The source CIDR for the rule. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_rule_source_type"></a> [rule\_source\_type](#input\_rule\_source\_type) | The type of the source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_tcp_rules"></a> [tcp\_rules](#input\_tcp\_rules) | A map of TCP rules, each containing optional destination and source port ranges. | <pre>map(object({<br>    destination_port_range = optional(object({<br>      max = optional(string)<br>      min = optional(string)<br>    }))<br>    source_port_range = optional(object({<br>      max = optional(string)<br>      min = optional(string)<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_udp_rules"></a> [udp\_rules](#input\_udp\_rules) | A map of UDP rules, each containing optional destination and source port ranges. | <pre>map(object({<br>    destination_port_range = optional(object({<br>      max = optional(string)<br>      min = optional(string)<br>    }))<br>    source_port_range = optional(object({<br>      max = optional(string)<br>      min = optional(string)<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | The ID of the Virtual Cloud Network (VCN). | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
