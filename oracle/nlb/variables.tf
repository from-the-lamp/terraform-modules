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

variable "subnet_id" {
  type = string
}

variable "display_name" {
  type    = string
  default = "default"
}

variable "is_private" {
  type    = bool
  default = false
}

variable "is_preserve_source_destination" {
  type    = bool
  default = false
}

variable "network_security_group_ids" {
  type    = list(string)
  default = []
}

variable "nlb_ports" {
  type = list(object({
    port     = number
    protocol = string
  }))
  default = [
    {
      port     = 443
      protocol = "TCP"
    },
  ]
}
