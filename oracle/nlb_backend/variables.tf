variable "config_file_profile" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "display_name" {
  type = string
}

variable "backend_set_name" {
  type = string
}

variable "nlb_id" {
  type = string
}

variable "port" {
  type    = number
  default = 443
}

variable "target_ids" {
  type = list(string)
}
