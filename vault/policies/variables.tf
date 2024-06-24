variable "policies" {
  type = list(object({
    policy_name  = string
    path         = string
    capabilities = list(string)
  }))
  default = []
}
