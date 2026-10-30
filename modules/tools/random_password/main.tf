resource "random_password" "template" {
  length  = var.password_length
  special = var.password_special
}
