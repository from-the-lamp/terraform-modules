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

  # The provider defaults push_events to true - explicitly off, since this
  # hook exists for pipeline_events only (ingest-gitlab's webhook handler
  # ignores every other GitLab event type anyway, but there's no reason to
  # make GitLab send them in the first place).
  push_events                  = false
  tag_push_events              = false
  issues_events                = false
  confidential_issues_events   = false
  merge_requests_events        = false
  note_events                  = false
  confidential_note_events     = false
  job_events                   = false
  deployment_events            = false
  releases_events              = false
  wiki_page_events             = false
  emoji_events                 = false
  milestone_events             = false
  resource_access_token_events = false
  resource_deploy_token_events = false
  feature_flag_events          = false
  vulnerability_events         = false
}
