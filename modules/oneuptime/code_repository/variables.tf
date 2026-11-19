variable "name" {
  type        = string
  description = "Friendly name shown in OneUptime."
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "What this repository is, for OneUptime AI's own reference."
}

variable "repository_hosted_at" {
  type        = string
  default     = "GitLab"
  description = "One of GitHub, GitLab, Forgejo, Git."

  validation {
    condition     = contains(["GitHub", "GitLab", "Forgejo", "Git"], var.repository_hosted_at)
    error_message = "repository_hosted_at must be one of: GitHub, GitLab, Forgejo, Git."
  }
}

variable "organization_name" {
  type        = string
  description = "The GitLab group/user that owns the repo, full path (e.g. \"from-the-lamp/infra\")."
}

variable "repository_name" {
  type        = string
  description = "The repository's own name within organization_name (e.g. \"argo-apps\")."
}

variable "repository_url" {
  type        = string
  default     = null
  description = "The repository's GitLab page address."
}

variable "main_branch_name" {
  type        = string
  default     = "main"
  description = "Default branch OneUptime AI targets a fix pull request against."
}
