variable "policies" {
  description = "A list of Vault ACL policies, each defining a path and allowed capabilities."
  type = list(object({
    policy_name  = string
    path         = string
    capabilities = list(string)
  }))
  default = []
}
