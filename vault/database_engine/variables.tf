variable "host" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "path" {
  type    = string
  default = "postgres"
}

variable "name" {
  type    = string
  default = "postgres"
}

variable "allowed_roles" {
  type    = list(string)
  default = ["value"]
}

variable "connection_url" {
  type = string
}

variable "root_username" {
  type    = string
  default = ""
}

variable "root_password" {
  type      = string
  default   = ""
  sensitive = true
}
