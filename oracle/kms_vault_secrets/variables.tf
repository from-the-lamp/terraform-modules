variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "vault_id" {
  type = string
}

variable "key_id" {
  type = string
}

variable "secrets" {
  type    = map(string)
  default = {}
}
