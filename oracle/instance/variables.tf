variable "config_file_profile" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "freeform_tags" {
  type = map(string)
  default = {
    "provisioner" = "terraform"
  }
}

variable "display_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "compute_shape" {
  type    = string
  default = "VM.Standard.A1.Flex"
}

variable "operating_system" {
  type    = string
  default = "Canonical Ubuntu"
}

variable "operating_system_version" {
  type    = string
  default = "22.04"
}

variable "admin_ssh_pub" {
  type = string
}

variable "user_data" {
  type = string
}

variable "ad_number" {
  type = string
}
