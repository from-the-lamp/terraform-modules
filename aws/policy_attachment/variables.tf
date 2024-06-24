variable "username" {
  type        = string
  description = "The username for the AWS IAM user."
}

variable "policy_arns" {
  description = "A list of policy ARNs to be attached to the user."
  type        = list(string)
  default     = []
}
