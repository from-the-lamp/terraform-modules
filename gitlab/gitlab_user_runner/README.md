## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 17.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 17.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_user_runner.template](https://registry.terraform.io/providers/gitlabhq/gitlab/17.1.0/docs/resources/user_runner) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `""` | no |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | n/a | `number` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `number` | `null` | no |
| <a name="input_runner_type"></a> [runner\_type](#input\_runner\_type) | n/a | `string` | `"group_type"` | no |
| <a name="input_tag_list"></a> [tag\_list](#input\_tag\_list) | n/a | `list(string)` | `[]` | no |
| <a name="input_untagged"></a> [untagged](#input\_untagged) | n/a | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_token"></a> [token](#output\_token) | n/a |
