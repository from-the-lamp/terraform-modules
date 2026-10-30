variable "path" {
  type        = string
  default     = "secrets"
  description = "The mount path."
}

variable "data" {
  type        = map(string)
  sensitive   = true
  description = "A map of key-value pairs representing the secret data."
}

variable "secret_path" {
  type        = string
  description = "The secret path."
}
