output "password" {
  value     = random_password.template.result
  sensitive = true
}
