variable "roles" {
  type = list(object({
    backend                    = string
    role_name                  = string
    service_account_names      = list(string)
    service_account_namespaces = list(string)
    token_ttl                  = optional(number)
    token_max_ttl              = optional(number)
    token_explicit_max_ttl     = optional(number)
    token_no_default_policy    = optional(bool)
    token_num_uses             = optional(number)
    token_policies             = optional(list(string))
    audience                   = optional(string)
  }))
}
