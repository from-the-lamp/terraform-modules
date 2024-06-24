terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.18.0"
    }
  }
}

provider "postgresql" {
  host            = var.host
  port            = var.port
  database        = var.database
  username        = var.username
  password        = var.password
  sslmode         = var.sslmode
  connect_timeout = var.connect_timeout
  superuser       = var.superuser
}
