resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = var.path
}

resource "vault_kubernetes_auth_backend_config" "template" {
  backend         = vault_auth_backend.kubernetes.path
  kubernetes_host = "https://kubernetes.default.svc"
}
