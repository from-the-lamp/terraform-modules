variable "config_file_profile" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "access_type" {
  type    = string
  default = "NoPublicAccess"
}

variable "versioning" {
  type    = string
  default = "Disabled"
}
