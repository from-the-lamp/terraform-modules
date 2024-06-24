variable "host" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}
variable "role_name" {
  type = string
}

variable "backend_path" {
  type    = string
  default = "kubernetes"
}

variable "token_policies" {
  type = list(string)
}

variable "service_account_names" {
  type = list(string)
}

variable "service_account_namespaces" {
  type = list(string)
}

variable "token_ttl" {
  type    = number
  default = 30
}

variable "token_max_ttl" {
  type    = number
  default = 30
}

variable "token_explicit_max_ttl" {
  type    = number
  default = 30
}

variable "token_no_default_policy" {
  type    = bool
  default = false
}

variable "token_num_uses" {
  type    = number
  default = 3
}

variable "audience" {
  type = string
  default = ""
}
