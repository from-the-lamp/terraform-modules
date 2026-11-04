data "gitlab_group" "this" {
  full_path = var.group
}

resource "gitlab_group_service_account" "bot" {
  group = var.group
  name  = var.bot_name
}

resource "gitlab_group_membership" "bot" {
  # Unlike gitlab_group_service_account.group above, this resource's
  # group_id is typed as a number, not a path string - resolved here via a
  # data source instead of asking the caller for a numeric ID directly.
  group_id     = data.gitlab_group.this.id
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

  depends_on = [gitlab_group_membership.bot]
}
