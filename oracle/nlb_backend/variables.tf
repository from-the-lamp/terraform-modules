variable "compartment_ocid" {
  type        = string
  description = "The OCID of the compartment where the resource will be created."
}

variable "display_name" {
  type        = string
  description = "The display name of the resource."
}

variable "backend_set_name" {
  type        = string
  description = "The name of the backend set."
}

variable "nlb_id" {
  type        = string
  description = "The ID of the Network Load Balancer (NLB)."
}

variable "port" {
  type        = number
  default     = 443
  description = "The port number for the backend set."
}

variable "target_ids" {
  type        = list(string)
  description = "A list of target IDs to be included in the backend set."
}
