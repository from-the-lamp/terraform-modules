data "gitlab_project_variable" "template" {
  project = var.gitlab_project_id
  key     = var.gitlab_project_variable
}

output "variables" {
  value     = yamldecode(data.gitlab_project_variable.template.value)
  sensitive = true
}
