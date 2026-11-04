## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement\_terraform) | >= 1.5.0 |
| [gitlab](#requirement\_gitlab) | ~> 19.0 |

## Providers

| Name | Version |
|------|---------|
| [gitlab](#provider\_gitlab) | ~> 19.0 |

## Resources

| Name | Type |
|------|------|
| [gitlab_group_service_account.bot](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group_service_account) | resource |
| [gitlab_project_membership.bot](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_membership) | resource |
| [gitlab_group_service_account_access_token.bot](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group_service_account_access_token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| group | Top-level GitLab group the service account belongs to | `string` | n/a | yes |
| project | Single project this bot is scoped to | `string` | n/a | yes |
| bot_name | Display name for the service account user | `string` | n/a | yes |
| access_level | Project access level granted to the bot | `string` | `"developer"` | no |
| token_scopes | Scopes granted to the bot's access token | `list(string)` | `["write_repository"]` | no |
| rotate_before_days | Days before expiration to trigger rotation | `number` | n/a | yes |
| expiration_days | Lifetime (days) of the token produced by each rotation | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| user_id | The service account's GitLab user ID |
| token | The bot's current access token value (sensitive) |

## Notes

- Group Service Accounts are a Free-tier GitLab.com feature (unlike Project/Group Access Tokens,
  which require Premium/Ultimate on GitLab.com SaaS) — creating one needs the Owner role on the
  top-level group, not instance admin.
- The service account's actual permissions come from `gitlab_project_membership`, exactly like a
  real user — the service account itself is tenant-wide, scoping to one repo is this module's job,
  not GitLab's.
- `rotation_configuration` only rotates the token on an actual `terraform apply` run that falls
  inside the `rotate_before_days` window before `expiration_days` runs out — this module does not
  itself schedule anything; something has to run `apply` periodically (see the terragrunt unit).
- Deliberately does not write the token anywhere — pair with `vault/secrets_managed`, not
  `vault/secrets` (that one ignores content drift and would never see a rotated value).
