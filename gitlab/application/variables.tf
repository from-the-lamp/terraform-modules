variable "gitlab_token" {
  type      = string
  sensitive = true
}

variable "app_name" {
  type = string
}

variable "redirect_url" {
  type = string
}

variable "scopes" {
  type    = list(string)
  default = ["openid"]
}

variable "confidential" {
  type    = bool
  default = true
}
