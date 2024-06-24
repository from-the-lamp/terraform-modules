variable "account_id" {
  type        = string
  description = "The Cloudflare account ID or user zone ID"
  default     = null
}

variable "zone_id" {
  type        = string
  description = "The Cloudflare zone ID or user account ID"
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

variable "virtual_networks" {
  description = "Map of virtual network configurations"
  type = map(object({
    account_id           = string
    virtual_network_name = string
    comment              = string
  }))
  default = {}
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

variable "access_identity_client_id" {
  type        = string
  description = "Identity client ID"
}

variable "access_identity_client_secret" {
  type        = string
  description = "Identity client Secret"
}

variable "access_identity_tenant_id" {
  type        = string
  description = "AzureAD tenant ID"
}

variable "private_dns_servers" {
  type        = list(string)
  default     = ["168.63.129.16"]
  description = "List of private DNS servers"
}

variable "private_domains" {
  description = "List of private domains"
  type = list(object({
    suffix      = string
    description = string
  }))
}
