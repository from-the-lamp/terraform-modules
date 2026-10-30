variable "instance_id" {
  type        = string
  description = "The ID of the instance from which files will be fetched."
}

variable "user" {
  type        = string
  default     = "ubuntu"
  description = "The username to use for connecting to the instance."
}

variable "private_key" {
  type        = string
  description = "The private key for SSH authentication."
}

variable "remote_files_paths" {
  description = "List of files to fetch from the remote instance."
  type        = list(string)
  default     = []
}

variable "use_sudo" {
  type        = bool
  default     = false
  description = "A flag indicating whether to use sudo for fetching files."
}

variable "timeout" {
  type        = string
  default     = "5m"
  description = "The timeout duration for fetching files."
}

variable "retry_delay" {
  type        = string
  default     = "5s"
  description = "The delay duration between retry attempts."
}
