output "id" {
  description = "The project's numeric ID."
  value       = gitlab_project.this.id
}

output "path_with_namespace" {
  description = "Full path including namespace (e.g. \"from-the-lamp/infra/helm-charts\")."
  value       = gitlab_project.this.path_with_namespace
}
