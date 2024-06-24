variable "backend_path" {
  type    = string
  default = "postgres"
}

variable "role_name" {
  type = string
}

variable "db_name" {
  type = string
}

variable "creation_statements" {
  type    = list(string)
  default = []
}
