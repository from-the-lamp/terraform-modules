variable "username" {
  type = string
}

variable "policy_arns" {
  description = "A list of policy ARNs to be attached to the user"
  type        = list(string)
  default     = []
}
