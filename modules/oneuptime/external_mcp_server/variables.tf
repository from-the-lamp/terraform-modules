variable "name" {
  type        = string
  description = "Label shown in OneUptime, e.g. the server's purpose or identity."
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "What this MCP server is for - OneUptime AI reads this to choose which servers to use."
}

variable "url" {
  type        = string
  description = "The MCP server's own endpoint (Streamable HTTP or SSE - OneUptime detects which on connect). Never put credentials in this URL; use auth_type instead."
}

variable "auth_type" {
  type        = string
  default     = "None"
  description = "One of None, BearerToken, Headers, OAuthClientCredentials."

  validation {
    condition     = contains(["None", "BearerToken", "Headers", "OAuthClientCredentials"], var.auth_type)
    error_message = "auth_type must be one of: None, BearerToken, Headers, OAuthClientCredentials."
  }
}

variable "bearer_token" {
  type        = string
  default     = null
  sensitive   = true
  description = "Used only when auth_type = BearerToken; sent as an Authorization: Bearer header."
}

variable "headers" {
  type        = map(string)
  default     = null
  description = "Used only when auth_type = Headers; header name/value pairs sent with every request, e.g. a custom API-key header. Values are encrypted at rest by OneUptime."
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "A disabled server is never used by OneUptime AI, even if an AI rule references it."
}

variable "oauth_token_url" {
  type        = string
  default     = null
  description = "Used only when auth_type = OAuthClientCredentials; the OAuth token endpoint."
}

variable "oauth_client_id" {
  type        = string
  default     = null
  description = "Used only when auth_type = OAuthClientCredentials."
}

variable "oauth_client_secret" {
  type        = string
  default     = null
  sensitive   = true
  description = "Used only when auth_type = OAuthClientCredentials."
}

variable "oauth_scope" {
  type        = string
  default     = null
  description = "Scope to request, if the token endpoint requires one."
}

variable "oauth_audience" {
  type        = string
  default     = null
  description = "Audience to request, if the token endpoint requires one."
}
