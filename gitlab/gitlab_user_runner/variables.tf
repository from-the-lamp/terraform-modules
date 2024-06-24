variable "description" {
  type    = string
  default = ""
}

variable "runner_type" {
  type    = string
  default = "group_type"
}

variable "group_id" {
  type    = number
  default = null
}

variable "project_id" {
  type    = number
  default = null
}

variable "tag_list" {
  type    = list(string)
  default = []
}

variable "untagged" {
  type    = bool
  default = true
}
