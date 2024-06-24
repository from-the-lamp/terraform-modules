variable "config_file_profile" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "user" {
  type    = string
  default = "ubuntu"
}

variable "private_key" {
  type = string
}

variable "remote_files_paths" {
  description = "List of files to fetch"
  type        = list(string)
  default     = []
}

variable "use_sudo" {
  type    = bool
  default = false
}

variable "timeout" {
  type    = string
  default = "5m"
}

variable "retry_delay" {
  type    = string
  default = "5s"
}
