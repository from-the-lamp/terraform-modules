variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "vault_id" {
  type        = string
  description = "The OCID of the KMS vault where secrets will be stored."
}

variable "key_id" {
  type        = string
  description = "The OCID of the master encryption key used to encrypt secrets."
}

variable "secrets" {
  type        = map(string)
  default     = {}
  description = "A map of secret names to their plaintext values."
  sensitive   = true
}
