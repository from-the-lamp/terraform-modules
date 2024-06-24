resource "gitlab_user_runner" "template" {
  runner_type = var.runner_type
  description = var.description
  group_id    = var.group_id
  project_id  = var.project_id
  tag_list    = var.tag_list
  untagged    = var.untagged
}

output "token" {
  value     = gitlab_user_runner.template.token
  sensitive = true
}
