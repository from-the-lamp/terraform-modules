data "vault_kv_secret_v2" "shared" {
  mount = var.vault_mount
  name  = var.vault_secret_path
}

resource "gitlab_project_hook" "pipeline" {
  project                 = var.project
  url                     = var.url
  token                   = data.vault_kv_secret_v2.shared.data[var.vault_property]
  pipeline_events         = var.pipeline_events
  enable_ssl_verification = var.enable_ssl_verification
}
