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
| [gitlab_project_variable.template](https://registry.terraform.io/providers/gitlabhq/gitlab/17.1.0/docs/data-sources/project_variable) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gitlab_project_id"></a> [gitlab\_project\_id](#input\_gitlab\_project\_id) | The ID of the GitLab project. | `string` | n/a | yes |
| <a name="input_gitlab_project_variable"></a> [gitlab\_project\_variable](#input\_gitlab\_project\_variable) | The variable to be set for the GitLab project. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_variables"></a> [variables](#output\_variables) | n/a |
