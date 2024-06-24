variable "gitlab_group_full_path" {
  type        = string
  description = "The full path of the GitLab group."
}

variable "environment_scope" {
  type        = string
  default     = "*"
  description = "The scope of the environment for which the variables are applied."
}

variable "vars" {
  type = map(object({
    value     = string
    protected = bool
    masked    = bool
  }))
  default     = {}
  description = "A map of variables to be set in GitLab CI/CD, each containing a value, and flags for whether the variable is protected and/or masked."
}
