resource "gitlab_group_service_account" "bot" {
  group = var.group
  name  = var.bot_name
}

resource "gitlab_project_membership" "bot" {
  project      = var.project
  user_id      = gitlab_group_service_account.bot.service_account_id
  access_level = var.access_level
}

resource "gitlab_group_service_account_access_token" "bot" {
  group   = var.group
  user_id = gitlab_group_service_account.bot.service_account_id
  name    = "${var.bot_name}-token"
  scopes  = var.token_scopes

  rotation_configuration = {
    rotate_before_days = var.rotate_before_days
    expiration_days    = var.expiration_days
  }

  depends_on = [gitlab_project_membership.bot]
}
