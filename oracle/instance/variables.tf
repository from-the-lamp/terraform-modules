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

variable "display_name" {
  type        = string
  description = "The display name of the resource."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the resource will be created."
}

variable "compute_shape" {
  type        = string
  default     = "VM.Standard.A1.Flex"
  description = "The compute shape of the instance."
}

variable "operating_system" {
  type        = string
  default     = "Canonical Ubuntu"
  description = "The operating system of the instance."
}

variable "operating_system_version" {
  type        = string
  default     = "22.04"
  description = "The version of the operating system."
}

variable "admin_ssh_pub" {
  type        = string
  description = "The SSH public key for the admin user."
}

variable "user_data" {
  type        = string
  description = "The user data to be provided to the instance."
}

variable "ad_number" {
  type        = string
  description = "The availability domain number where the resource will be created."
}
