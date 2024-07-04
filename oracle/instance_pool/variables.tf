variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "freeform_tags" {
  type = map(string)
  default = {
    "provisioner" = "terraform"
  }
  description = "A map of freeform tags to apply to the resource."
}

variable "instance_configuration_id" {
  type        = string
  description = "The ID of the instance configuration."
}

variable "primary_subnet_id" {
  type        = string
  description = "The ID of the primary subnet where the resource will be created."
}

variable "display_name" {
  type        = string
  description = "The display name of the resource."
}

variable "size" {
  type        = number
  default     = 1
  description = "The number of instances to create."
}

variable "ad_number" {
  type        = string
  description = "The availability domain number where the resource will be created."
}
