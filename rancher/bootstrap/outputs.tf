output "token" {
  value     = rancher2_bootstrap.admin.token
  sensitive = true
}