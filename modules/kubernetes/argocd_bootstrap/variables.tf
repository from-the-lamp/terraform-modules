variable "name" {
  type        = string
  default     = "hetzner-projects"
  description = "The name of the root ArgoCD Application."
}

variable "namespace" {
  type        = string
  default     = "argocd"
  description = "The namespace ArgoCD itself runs in."
}

variable "repo_url" {
  type        = string
  description = "The argo-apps git repository URL."
}

variable "target_revision" {
  type        = string
  default     = "HEAD"
  description = "The git revision to track."
}

variable "path" {
  type        = string
  description = "The path within the repo this Application points at (e.g. \"projects\")."
}
