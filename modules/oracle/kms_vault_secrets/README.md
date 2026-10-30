## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 8.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 8.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_vault_secret.template](https://registry.terraform.io/providers/oracle/oci/8.5.0/docs/resources/vault_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | The OCID of the compartment where the resource will be created. | `string` | n/a | yes |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | The OCID of the master encryption key used to encrypt secrets. | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | A map of secret names to their plaintext values. | `map(string)` | `{}` | no |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | The OCID of the KMS vault where secrets will be stored. | `string` | n/a | yes |

## Outputs

No outputs.

## Notes

- `secrets` is `sensitive = true`, which redacts values from CLI/plan output, but the plaintext still lands in Terraform state — the state backend must be encrypted and access-controlled.
- Renaming a key in `secrets` (not just changing its value) destroys and recreates that `oci_vault_secret`, since resources are keyed by `nonsensitive(toset(keys(var.secrets)))`. OCI secret deletion is a scheduled soft-delete with a recovery window, so renaming away from and back to the same name shortly after can collide with the pending deletion.
