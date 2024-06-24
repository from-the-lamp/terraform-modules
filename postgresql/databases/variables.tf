variable "host" {
  type    = string
  default = "postgresql-hl"
}

variable "port" {
  type    = string
  default = "5432"
}

variable "database" {
  type    = string
  default = "postgres"
}

variable "username" {
  type    = string
  default = "postgres"
}

variable "password" {
  type    = string
  default = "postgres"
}

variable "sslmode" {
  type    = string
  default = "disable"
}

variable "connect_timeout" {
  type    = number
  default = 180
}

variable "superuser" {
  type    = bool
  default = false
}

variable "dbname" {
  type = string
}
