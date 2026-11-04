## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement\_terraform) | >= 1.5.0 |
| [gitlab](#requirement\_gitlab) | ~> 19.0 |

## Resources

| Name | Type |
|------|------|
| [gitlab_project.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project) | resource |
| [gitlab_branch_protection.default](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/branch_protection) | resource |
| [gitlab_group.namespace](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/group) | data source |

## Notes

- `push_access_level`/`merge_access_level` (not `allowed_to_push`/`allowed_to_merge`) deliberately -
  the attribute-set form is Premium/Ultimate-only on GitLab.com SaaS, same tier gate as
  Project/Group Access Tokens. These two fields work on Free.
- **For an already-existing project (the normal case here): `terraform import` both resources
  before the first `apply`.** Applying straight from a terragrunt unit whose inputs describe an
  existing repo tries to CREATE a new project at that namespace/path, which GitLab will reject
  with "has already been taken" - a safe failure, but confirm with a `plan` first regardless.
  After import, reconcile any `plan` diff against the project's actual real settings before
  applying - this module's defaults are a best guess at current reality, not a confirmed read of
  it.
