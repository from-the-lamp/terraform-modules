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

variable "instance_configuration_id" {
  type = string
}

variable "primary_subnet_id" {
  type = string
}

variable "display_name" {
  type = string
}

variable "size" {
  type    = number
  default = 1
}

variable "ad_number" {
  type = string
}
