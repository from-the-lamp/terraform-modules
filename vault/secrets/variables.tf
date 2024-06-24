variable "host" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "path" {
  type    = string
  default = "secrets"
}

variable "data" {
  type      = map(string)
  sensitive = true
}

variable "secret_path" {
  type = string
}
