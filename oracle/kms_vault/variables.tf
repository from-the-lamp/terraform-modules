variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "display_name" {
  type        = string
  description = "The display name of the resource."
}

variable "vault_type" {
  type    = string
  default = "DEFAULT"
}
