resource "vault_database_secret_backend_role" "role" {
  backend             = var.backend_path
  name                = var.role_name
  db_name             = var.db_name
  creation_statements = var.creation_statements
}
