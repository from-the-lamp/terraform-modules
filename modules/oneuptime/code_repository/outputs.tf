output "id" {
  value = oneuptime_code_repository.this.id
}

output "git_lab_project_id" {
  description = "The GitLab project ID OneUptime resolved once the repository connected - null until then."
  value       = oneuptime_code_repository.this.git_lab_project_id
}
