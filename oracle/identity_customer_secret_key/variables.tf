variable "config_file_profile" {
  type        = string
  description = "The profile name in the configuration file."
}

variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "name" {
  type        = string
  description = "The name of the resource."
}

variable "user_id" {
  type        = string
  description = "The user ID associated with the resource."
}
