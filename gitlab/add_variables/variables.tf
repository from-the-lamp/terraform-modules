variable "gitlab_token" {
  type        = string
  sensitive   = true
}

variable "gitlab_group_full_path" {
  type        = string
}

variable "environment_scope" {
  type    = string
  default = "*"
}

variable "vars" {
  type = map(object({
    value     = string
    protected = bool
    masked    = bool
  }))
  default = {}
}
