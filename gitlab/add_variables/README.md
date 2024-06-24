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
| [gitlab_group_variable.variable](https://registry.terraform.io/providers/gitlabhq/gitlab/17.1.0/docs/resources/group_variable) | resource |
| [gitlab_group.template](https://registry.terraform.io/providers/gitlabhq/gitlab/17.1.0/docs/data-sources/group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_scope"></a> [environment\_scope](#input\_environment\_scope) | The scope of the environment for which the variables are applied, defaulting to all environments. | `string` | `"*"` | no |
| <a name="input_gitlab_group_full_path"></a> [gitlab\_group\_full\_path](#input\_gitlab\_group\_full\_path) | The full path of the GitLab group. | `string` | n/a | yes |
| <a name="input_vars"></a> [vars](#input\_vars) | A map of variables to be set in GitLab CI/CD, each containing a value, and flags for whether the variable is protected and/or masked. | <pre>map(object({<br>    value     = string<br>    protected = bool<br>    masked    = bool<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
