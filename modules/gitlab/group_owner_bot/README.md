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
| [gitlab_group_membership.bot](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group_membership) | resource |
| [gitlab_group_service_account_access_token.bot](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group_service_account_access_token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| group | Top-level GitLab group the service account belongs to and is granted access on | `string` | n/a | yes |
| bot_name | Display name for the service account user | `string` | n/a | yes |
| access_level | Group access level granted to the bot | `string` | `"owner"` | no |
| token_scopes | Scopes granted to the bot's access token | `list(string)` | `["api"]` | no |
| rotate_before_days | Days before expiration to trigger rotation | `number` | n/a | yes |
| expiration_days | Lifetime (days) of the token produced by each rotation | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| user_id | The service account's GitLab user ID |
| token | The bot's current access token value (sensitive) |

## Notes

- Sibling to `gitlab/service_account`, not a replacement for it - that module scopes a bot to
  one project via `gitlab_project_membership` (Developer by default); this one grants group-wide
  access via `gitlab_group_membership`, almost always `owner`. Kept separate on purpose: mixing
  "narrow per-repo bot" and "group-wide Owner bot" behind one set of inputs would make it too easy
  to hand a per-repo bot group Owner by passing the wrong input.
- The `owner` default is not a conservative starting point to narrow later - creating or rotating
  a Group Service Account's own access token is itself a group-Owner-only GitLab API call
  (`POST /groups/:id/service_accounts/:user_id/personal_access_tokens`), independent of which
  project(s) the resulting token is later used against. A bot built from this module that only
  needs to manage Service Accounts (not, say, arbitrary group settings) still needs `owner` - there
  is no narrower built-in role that covers it.
- Bootstrapping is inherently manual: creating the very first instance of this module needs a
  caller that already holds group Owner (a human's own PAT) - nothing can grant a service account
  group Owner without an already-Owner-level actor doing it. After that one-time step, the bot's
  own (rotating) token can be used as the caller for every subsequent apply, including re-applying
  this same unit to rotate its own token.
- Deliberately does not write the token anywhere - pair with `vault/secrets_managed`, not
  `vault/secrets` (that one ignores content drift and would never see a rotated value).
