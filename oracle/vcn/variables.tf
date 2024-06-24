variable "config_file_profile" {
  type        = string
  description = "The profile name in the configuration file."
}

variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the VCN will be created."
}

variable "freeform_tags" {
  type = map(string)
  default = {
    "provisioner" = "terraform"
  }
  description = "A map of freeform tags to apply to the VCN."
}

variable "vcn_internet_gateway_enabled" {
  type        = bool
  default     = false
  description = "A flag indicating whether to enable the internet gateway for the VCN."
}

variable "vcn_dns_label" {
  type        = string
  description = "The DNS label for the VCN."
}

variable "vcn_name" {
  type        = string
  description = "The name of the VCN."
}

variable "vcn_internet_gateway_name" {
  type        = string
  default     = "default"
  description = "The name of the internet gateway for the VCN."
}

variable "oci_core_vcn_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VCN."
}

variable "vcn_subnets" {
  type = map(object({
    cidr_block = string
    dns_label  = string
  }))
  default     = {}
  description = "A map of subnets within the VCN, each containing a CIDR block and DNS label."
}
