resource "postgresql_role" "template" {
  name     = var.dbname
  password = var.dbname
  login    = true
}

resource "postgresql_database" "template" {
  name              = var.dbname
  owner             = var.dbname
  connection_limit  = "-1"
  allow_connections = true
  depends_on        = [postgresql_role.template]
}
