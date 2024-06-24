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

variable "vcn_internet_gateway_enabled" {
  type    = bool
  default = false
}

variable "vcn_dns_label" {
  type = string
}

variable "vcn_name" {
  type = string
}

variable "vcn_internet_gateway_name" {
  type    = string
  default = "default"
}

variable "oci_core_vcn_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vcn_subnets" {
  type = map(object({
    cidr_block = string
    dns_label  = string
  }))
  default = {}
}
