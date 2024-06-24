variable "host" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "path" {
  type    = string
  default = "kubernetes"
}
