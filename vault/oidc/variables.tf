variable "path" {
  type        = string
  description = "The path within the authentication provider configuration."
}

variable "role_type" {
  type        = string
  default     = "oidc"
  description = "The type of role, typically set to 'oidc' for OpenID Connect roles."
}

variable "bound_issuer" {
  type        = string
  description = "The issuer of the tokens that this role will be bound to."
}

variable "oidc_client_id" {
  type        = string
  description = "The client ID for the OpenID Connect (OIDC) application."
}

variable "oidc_client_secret" {
  type        = string
  sensitive   = true
  description = "The client secret for the OpenID Connect (OIDC) application."
}

variable "role_name" {
  type        = string
  default     = "default"
  description = "The name of the role to be created."
}

variable "user_claim" {
  type        = string
  default     = "sub"
  description = "The claim in the token that maps to the user."
}

variable "allowed_redirect_uris" {
  type        = set(string)
  description = "A set of allowed redirect URIs for the OIDC role."
}

variable "oidc_discovery_url" {
  type        = string
  description = "The discovery URL for the OpenID Connect (OIDC) provider."
}

variable "bound_audiences" {
  type        = list(string)
  description = "A list of audiences that the token must include."
}

variable "groups_claim" {
  type        = string
  default     = "groups"
  description = "The claim in the token that maps to the user's groups."
}

variable "identity_groups" {
  type = list(object({
    identity_name     = string
    identity_type     = string
    identity_policies = list(string)
  }))
  description = "A list of identity groups, each containing the identity name, type, and associated policies."
}
