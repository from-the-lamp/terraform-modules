variable "description" {
  description = "Description of the OAuth client (alphanumeric characters only)"
  type        = string
}

variable "scopes" {
  description = "OAuth scopes to grant the client, see https://tailscale.com/kb/1623/"
  type        = list(string)
}

variable "tags" {
  description = "Tags the client's access tokens are allowed to assign to devices. Required if scopes include devices:core or auth_keys"
  type        = list(string)
  default     = []
}
