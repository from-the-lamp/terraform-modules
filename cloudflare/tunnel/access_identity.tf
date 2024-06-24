resource "cloudflare_access_identity_provider" "template" {
  account_id = var.account_id
  name       = "Azure Entra"
  type       = "azureAD"
  config {
    client_id     = var.access_identity_client_id
    client_secret = var.access_identity_client_secret
    directory_id  = var.access_identity_tenant_id
  }
}
