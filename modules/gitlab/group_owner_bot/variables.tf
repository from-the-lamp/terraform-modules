variable "group" {
  type        = string
  description = "The ID or URL-encoded path of the top-level GitLab group the service account belongs to and is granted group-wide access on."
}

variable "bot_name" {
  type        = string
  description = "Display name for the service account user (e.g. \"terragrunt-automation\")."
}

variable "access_level" {
  type        = string
  default     = "owner"
  description = "Group access level granted to the bot. GitLab only lets a top-level group Owner create or rotate a Group Service Account token in the first place, so a narrower working default would not actually work."
}

variable "token_scopes" {
  type        = list(string)
  default     = ["api"]
  description = "Scopes granted to the bot's access token. \"api\" (not \"write_repository\") - this bot drives the gitlab Terraform provider's admin-level calls (service accounts, project/membership/branch-protection settings), not just git push/pull."
}

variable "rotate_before_days" {
  type        = number
  description = "Days before expiration when the token should be rotated on the next terraform apply."
}

variable "expiration_days" {
  type        = number
  description = "Lifetime (in days) of the token produced by each rotation."
}
