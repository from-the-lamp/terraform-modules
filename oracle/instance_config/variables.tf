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

variable "operating_system" {
  type    = string
  default = "Canonical Ubuntu"
}

variable "operating_system_version" {
  type    = string
  default = "22.04"
}

variable "subnet_id" {
  type = string
}

variable "display_name" {
  type = string
}

variable "admin_ssh_pub" {
  type = string
}

variable "user_data" {
  type = string
}

variable "compute_shape" {
  type    = string
  default = "VM.Standard.A1.Flex"
}

variable "nsg_ids" {
  type    = list(string)
  default = []
}

variable "assign_public_ip" {
  type    = bool
  default = false
}

variable "ad_number" {
  type = string
}
