variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "name" {
  type        = string
  description = "The name of the resource."
}

variable "namespace" {
  type        = string
  description = "The namespace in which the resource will be created."
}

variable "access_type" {
  type        = string
  default     = "NoPublicAccess"
  description = "The access type for the resource."
}

variable "versioning" {
  type        = string
  default     = "Disabled"
  description = "The versioning status of the resource."
}
