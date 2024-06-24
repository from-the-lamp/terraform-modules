variable "host" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "policy_name" {
  type = string
}

variable "policy_value" {
  type = list(object({
    path         = string
    capabilities = list(string)
  }))
  default = []
}
