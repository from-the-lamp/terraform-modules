data "gitlab_group" "template" {
  full_path = var.gitlab_group_full_path
}

resource "gitlab_group_variable" "variable" {
  for_each          = var.vars
  group             = data.gitlab_group.template.id
  environment_scope = var.environment_scope
  key               = each.key
  value             = each.value.value
  protected         = each.value.protected
  masked            = each.value.masked
}
