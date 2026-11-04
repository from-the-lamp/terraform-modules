output "user_id" {
  description = "The service account's GitLab user ID."
  value       = gitlab_group_service_account.bot.service_account_id
}

output "token" {
  description = "The bot's current access token value."
  value       = gitlab_group_service_account_access_token.bot.token
  sensitive   = true
}
