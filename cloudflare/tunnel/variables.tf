variable "account_id" {
  type        = string
  description = "The Cloudflare account ID"
  default     = null
}

variable "zone_id" {
  type        = string
  description = "The Cloudflare zone ID"
  default     = null
}

variable "tunnel_name" {
  type        = string
  description = "The Cloudflare tunnel name"
}

variable "tunnel_secret" {
  type        = string
  sensitive   = true
  description = "The Cloudflare tunnel secret string"
  default     = null
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type        = list(map(any))
  default     = []
}

variable "tunnel_routes" {
  description = "List of tunnel route configurations"
  type = list(object({
    network = string
    comment = string
  }))
  default = []
}

variable "warp_routing" {
  description = "Is warp routing enabled"
  type        = bool
  default     = true
}

variable "create_tunnel_config" {
  description = "Flag to control the creation of the tunnel config"
  type        = bool
  default     = false
}

variable "split_tunnels" {
  description = "List of split tunnels"
  type = list(object({
    address     = optional(string)
    host        = optional(string)
    description = string
  }))
  default = []
}

variable "private_domains" {
  description = "List of private domains"
  type = list(object({
    suffix      = string
    description = string
    dns_servers = list(string)
  }))
  default = []
}

variable "store_secrets_in_key_vault" {
  type        = bool
  default     = false
  description = "Put secrets to key vault"
}

variable "key_vault_id" {
  type        = string
  description = "App secrets key-vault ID"
  default     = null
}

variable "enable_identity_provider_zitadel" {
  description = "Enable or disable the creation of the identity provider resource"
  type        = bool
  default     = false
}

variable "identity_provider_zitadel" {
  type = object({
    name          = string
    auth_url      = string
    token_url     = string
    certs_url     = string
    client_id     = string
    client_secret = string
    scopes        = list(string)
  })
  default = {
    name          = ""
    auth_url      = ""
    token_url     = ""
    certs_url     = ""
    client_id     = ""
    client_secret = ""
    scopes        = []
  }
}

variable "enable_identity_provider_gitlab" {
  description = "Enable or disable the creation of the identity provider resource"
  type        = bool
  default     = false
}

variable "identity_provider_gitlab" {
  type = object({
    name          = string
    auth_url      = string
    token_url     = string
    certs_url     = string
    client_id     = string
    client_secret = string
    scopes        = list(string)
  })
  default = {
    name          = ""
    auth_url      = ""
    token_url     = ""
    certs_url     = ""
    client_id     = ""
    client_secret = ""
    scopes        = []
  }
}