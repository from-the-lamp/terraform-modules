variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment for the dynamic group and policy."
}

variable "name" {
  type        = string
  default     = "cloud-controller-manager"
  description = "The name of the dynamic group."
}
