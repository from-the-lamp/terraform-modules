variable "config_file_profile" {
  type        = string
  description = "The profile name in the configuration file."
}

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

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the resource will be created."
}

variable "display_name" {
  type        = string
  default     = "default"
  description = "The display name of the resource."
}

variable "is_private" {
  type        = bool
  default     = false
  description = "A flag indicating whether the resource is private."
}

variable "is_preserve_source_destination" {
  type        = bool
  default     = false
  description = "A flag indicating whether to preserve source and destination."
}

variable "network_security_group_ids" {
  type        = list(string)
  default     = []
  description = "A list of Network Security Group (NSG) IDs to be associated with the resource."
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
  description = "A list of ports and protocols for the Network Load Balancer (NLB)."
}
