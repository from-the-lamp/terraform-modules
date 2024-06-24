## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 5.46.0 |
| <a name="requirement_ssh"></a> [ssh](#requirement\_ssh) | 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.46.0 |
| <a name="provider_ssh"></a> [ssh](#provider\_ssh) | 2.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.boot_finished](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [ssh_resource.template](https://registry.terraform.io/providers/loafoe/ssh/2.7.0/docs/resources/resource) | resource |
| [oci_core_instance.template](https://registry.terraform.io/providers/oracle/oci/5.46.0/docs/data-sources/core_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_file_profile"></a> [config\_file\_profile](#input\_config\_file\_profile) | The profile name in the configuration file. | `string` | n/a | yes |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | The ID of the instance from which files will be fetched. | `string` | n/a | yes |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | The private key for SSH authentication. | `string` | n/a | yes |
| <a name="input_remote_files_paths"></a> [remote\_files\_paths](#input\_remote\_files\_paths) | List of files to fetch from the remote instance. | `list(string)` | `[]` | no |
| <a name="input_retry_delay"></a> [retry\_delay](#input\_retry\_delay) | The delay duration between retry attempts. | `string` | `"5s"` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The timeout duration for fetching files. | `string` | `"5m"` | no |
| <a name="input_use_sudo"></a> [use\_sudo](#input\_use\_sudo) | A flag indicating whether to use sudo for fetching files. | `bool` | `false` | no |
| <a name="input_user"></a> [user](#input\_user) | The username to use for connecting to the instance. | `string` | `"ubuntu"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_file_contents"></a> [file\_contents](#output\_file\_contents) | n/a |
