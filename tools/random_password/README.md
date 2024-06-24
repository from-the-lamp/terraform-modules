## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.template](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | The length of the generated password. | `number` | `20` | no |
| <a name="input_password_special"></a> [password\_special](#input\_password\_special) | Whether to include special characters in the generated password. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_password"></a> [password](#output\_password) | n/a |
