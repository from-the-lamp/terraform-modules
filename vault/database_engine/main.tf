resource "vault_mount" "database" {
  path = var.path
  type = "database"
}

resource "vault_database_secret_backend_connection" "template" {
  backend       = vault_mount.database.path
  name          = var.name
  allowed_roles = var.allowed_roles
  postgresql {
    connection_url = var.connection_url
    username       = var.root_username
    password       = var.root_password
  }
}
