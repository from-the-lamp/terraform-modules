data "gitlab_group" "namespace" {
  full_path = var.namespace_path
}

resource "gitlab_project" "this" {
  name             = var.name
  path             = coalesce(var.path, var.name)
  namespace_id     = data.gitlab_group.namespace.id
  description      = var.description
  visibility_level = var.visibility_level
  default_branch   = var.default_branch
  merge_method     = var.merge_method
  ci_config_path   = var.ci_config_path
}

resource "gitlab_branch_protection" "default" {
  project          = gitlab_project.this.id
  branch           = var.default_branch
  allow_force_push = var.allow_force_push

  # GitLab.com (SaaS) always returns the array-shaped
  # push_access_levels/merge_access_levels from its protected branches API,
  # even on Free - the provider rejects the scalar push_access_level/
  # merge_access_level fields here with "feature unavailable", regardless
  # of tier. A single access_level entry (no user_id/group_id) is the Free
  # equivalent of the old scalar fields; per-user/per-group entries are the
  # part that's actually Premium/Ultimate-gated.
  allowed_to_push = [
    { access_level = var.push_access_level }
  ]
  allowed_to_merge = [
    { access_level = var.merge_access_level }
  ]
}
