resource "gitlab_application" "template" {
  name         = var.app_name
  scopes       = var.scopes
  redirect_url = var.redirect_url
  confidential = var.confidential
}
