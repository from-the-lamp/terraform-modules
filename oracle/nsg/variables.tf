variable "config_file_profile" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "vcn_id" {
  type = string
}
variable "freeform_tags" {
  type = map(string)
  default = {
    "provisioner" = "terraform"
  }
}

variable "display_name" {
  type    = string
  default = "default"
}

variable "rule_direction" {
  type    = string
  default = "INGRESS"
}

variable "rule_protocol" {
  type    = number
  default = 6
}

variable "rule_source" {
  type    = string
  default = "0.0.0.0/0"
}

variable "rule_source_type" {
  type    = string
  default = "CIDR_BLOCK"
}

variable "tcp_rules" {
  type = map(object({
    destination_port_range = optional(object({
      max = optional(string)
      min = optional(string)
    }))
    source_port_range = optional(object({
      max = optional(string)
      min = optional(string)
    }))
  }))
  default = {}
}

variable "udp_rules" {
  type = map(object({
    destination_port_range = optional(object({
      max = optional(string)
      min = optional(string)
    }))
    source_port_range = optional(object({
      max = optional(string)
      min = optional(string)
    }))
  }))
  default = {}
}
