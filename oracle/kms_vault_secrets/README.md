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
| [oci_vault_secret.template](https://registry.terraform.io/providers/oracle/oci/6.4.0/docs/resources/vault_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | The OCID of the compartment where the resource will be created. | `string` | n/a | yes |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | n/a | `map(string)` | `{}` | no |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
