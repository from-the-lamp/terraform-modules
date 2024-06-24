variable "password_length" {
  type        = number
  default     = 20
  description = "The length of the generated password."
}

variable "password_special" {
  type        = bool
  default     = true
  description = "Whether to include special characters in the generated password."
}
