variable "namespace_path" {
  type        = string
  description = "Full path of the group/subgroup this project lives under (e.g. \"from-the-lamp/infra\")."
}

variable "name" {
  type        = string
  description = "Project name."
}

variable "path" {
  type        = string
  default     = null
  description = "Project path (URL slug). Defaults to var.name."
}

variable "description" {
  type        = string
  default     = null
  description = "Project description."
}

variable "visibility_level" {
  type = string
  # Confirmed via import+plan across all 5 from-the-lamp platform repos -
  # every one of them is actually public, not private. Not a guess anymore.
  default     = "public"
  description = "Project visibility: private, internal, or public."
}

variable "default_branch" {
  type        = string
  default     = "main"
  description = "Default (and protected) branch name."
}

variable "merge_method" {
  type        = string
  default     = "merge"
  description = "Merge method: merge, rebase_merge, or ff."
}

variable "ci_config_path" {
  type        = string
  default     = null
  description = "Custom CI config file path, if not the default .gitlab-ci.yml."
}

variable "push_access_level" {
  type        = string
  default     = "maintainer"
  description = "Who can push directly to default_branch. One of: no one, developer, maintainer, admin."
}

variable "merge_access_level" {
  type        = string
  default     = "maintainer"
  description = "Who can merge into default_branch. One of: no one, developer, maintainer, admin."
}

variable "allow_force_push" {
  type        = bool
  default     = false
  description = "Whether force-pushes to default_branch are permitted for users with push access."
}
