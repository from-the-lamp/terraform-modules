variable "group" {
  type        = string
  description = "The ID or URL-encoded path of the top-level GitLab group the service account belongs to."
}

variable "project" {
  type        = string
  description = "The ID or full path of the single project this bot is scoped to (not URL-encoded)."
}

variable "bot_name" {
  type        = string
  description = "Display name for the service account user (e.g. \"kelos-bot-helm-charts\")."
}

variable "access_level" {
  type        = string
  default     = "developer"
  description = "Project access level granted to the bot. One of GitLab's project_membership access_level values (lowercase)."
}

variable "token_scopes" {
  type        = list(string)
  default     = ["write_repository"]
  description = "Scopes granted to the bot's access token."
}

variable "rotate_before_days" {
  type        = number
  description = "Days before expiration when the token should be rotated on the next terraform apply."
}

variable "expiration_days" {
  type        = number
  description = "Lifetime (in days) of the token produced by each rotation."
}
