variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "vcn_id" {
  type        = string
  description = "The ID of the Virtual Cloud Network (VCN)."
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
  default     = "default"
  description = "The display name of the resource"
}

variable "rule_direction" {
  type        = string
  default     = "INGRESS"
  description = "The direction of the rule"
}

variable "rule_protocol" {
  type        = number
  default     = 6
  description = "The protocol number for the rule."
}

variable "rule_source" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The source CIDR for the rule."
}

variable "rule_source_type" {
  type        = string
  default     = "CIDR_BLOCK"
  description = "The type of the source for the rule."
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
  default     = {}
  description = "A map of TCP rules, each containing optional destination and source port ranges."
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
  default     = {}
  description = "A map of UDP rules, each containing optional destination and source port ranges."
}
