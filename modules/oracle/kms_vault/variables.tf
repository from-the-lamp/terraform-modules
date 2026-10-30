variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "display_name" {
  type        = string
  description = "The display name of the resource."
}

variable "vault_type" {
  type        = string
  default     = "DEFAULT"
  description = "The type of the KMS vault (DEFAULT or VIRTUAL_PRIVATE)."
}

variable "key_algorithm" {
  type        = string
  default     = "AES"
  description = "The encryption algorithm used for the master key."
}

variable "key_length" {
  type        = number
  default     = 16
  description = "The length of the master encryption key in bytes."
}
