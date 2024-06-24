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
| [gitlab_application.template](https://registry.terraform.io/providers/gitlabhq/gitlab/17.1.0/docs/resources/application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the application. | `string` | n/a | yes |
| <a name="input_confidential"></a> [confidential](#input\_confidential) | A flag indicating whether the application is confidential. | `bool` | `true` | no |
| <a name="input_redirect_url"></a> [redirect\_url](#input\_redirect\_url) | The URL to which the user will be redirected after authentication. | `string` | n/a | yes |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | A list of scopes that the application will request, defaulting to 'openid'. | `list(string)` | <pre>[<br>  "openid"<br>]</pre> | no |

## Outputs

No outputs.
