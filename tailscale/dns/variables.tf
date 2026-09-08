variable "magic_dns" {
  description = "Enable MagicDNS for the tailnet"
  type        = bool
  default     = true
}

variable "override_local_dns" {
  description = "Prefer global_nameservers over each device's local DNS configuration for names outside the tailnet"
  type        = bool
  default     = false
}

variable "global_nameservers" {
  description = "Global DNS nameservers devices on the tailnet use to resolve DNS names outside the tailnet"
  type = list(object({
    address            = string
    use_with_exit_node = optional(bool, false)
  }))
  default = []
}

variable "split_dns" {
  description = "Per-domain nameserver overrides (split DNS), equivalent to the Cloudflare tunnel module's private_domains/local_domain_fallback"
  type = list(object({
    domain = string
    nameservers = list(object({
      address            = string
      use_with_exit_node = optional(bool, false)
    }))
  }))
  default = []
}
