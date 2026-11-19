resource "oneuptime_code_repository" "this" {
  name        = var.name
  description = var.description

  repository_hosted_at = var.repository_hosted_at
  organization_name    = var.organization_name
  repository_name      = var.repository_name
  repository_url       = var.repository_url
  main_branch_name     = var.main_branch_name
}
