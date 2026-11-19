variable "name" {
  type        = string
  description = "Workflow name shown in OneUptime."
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "Friendly description of what the workflow does."
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "A disabled workflow's trigger never fires."
}

variable "graph" {
  type        = any
  description = "Workflow graph object ({ nodes, edges }) as OneUptime stores it."
}
