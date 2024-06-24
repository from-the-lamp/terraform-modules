variable "host" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "path" {
  type = string
}

variable "role_type" {
  type    = string
  default = "oidc"
}

variable "bound_issuer" {
  type = string
}

variable "oidc_client_id" {
  type = string
}

variable "oidc_client_secret" {
  type      = string
  sensitive = true
}

variable "role_name" {
  type    = string
  default = "default"
}

variable "user_claim" {
  type    = string
  default = "sub"
}

variable "allowed_redirect_uris" {
  type = set(string)
}

variable "oidc_discovery_url" {
  type = string
}

variable "bound_audiences" {
  type = list(string)
}

variable "groups_claim" {
  type    = string
  default = "groups"
}

variable "identity_groups" {
  type = list(object({
    identity_name     = string
    identity_type     = string
    identity_policies = list(string)
   }))
}
