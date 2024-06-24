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
| [oci_core_instance.template](https://registry.terraform.io/providers/oracle/oci/5.46.0/docs/resources/core_instance) | resource |
| [oci_core_images.template](https://registry.terraform.io/providers/oracle/oci/5.46.0/docs/data-sources/core_images) | data source |
| [oci_identity_availability_domain.template](https://registry.terraform.io/providers/oracle/oci/5.46.0/docs/data-sources/identity_availability_domain) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_number"></a> [ad\_number](#input\_ad\_number) | The availability domain number where the resource will be created. | `string` | n/a | yes |
| <a name="input_admin_ssh_pub"></a> [admin\_ssh\_pub](#input\_admin\_ssh\_pub) | The SSH public key for the admin user. | `string` | n/a | yes |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | The OCID of the compartment where the resource will be created. | `string` | n/a | yes |
| <a name="input_compute_shape"></a> [compute\_shape](#input\_compute\_shape) | The compute shape of the instance. | `string` | `"VM.Standard.A1.Flex"` | no |
| <a name="input_config_file_profile"></a> [config\_file\_profile](#input\_config\_file\_profile) | The profile name in the configuration file. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the resource. | `string` | n/a | yes |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | A map of freeform tags to apply to the resource. | `map(string)` | <pre>{<br>  "provisioner": "terraform"<br>}</pre> | no |
| <a name="input_operating_system"></a> [operating\_system](#input\_operating\_system) | The operating system of the instance. | `string` | `"Canonical Ubuntu"` | no |
| <a name="input_operating_system_version"></a> [operating\_system\_version](#input\_operating\_system\_version) | The version of the operating system. | `string` | `"22.04"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet where the resource will be created. | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to be provided to the instance. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
