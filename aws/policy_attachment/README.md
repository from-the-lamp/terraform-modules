## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.55.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.55.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_user_policy_attachment.template](https://registry.terraform.io/providers/hashicorp/aws/5.55.0/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | A list of policy ARNs to be attached to the user. | `list(string)` | `[]` | no |
| <a name="input_username"></a> [username](#input\_username) | The username for the AWS IAM user. | `string` | n/a | yes |

## Outputs

No outputs.
