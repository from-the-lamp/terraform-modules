variable "config_file_profile" {
  type = string
}

variable "host" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "namespace" {
  type = string
}

variable "app_name" {
  type = string
}

variable "token_ttl" {
  type    = number
  default = 30
}

variable "token_max_ttl" {
  type    = number
  default = 30
}

variable "token_explicit_max_ttl" {
  type    = number
  default = 30
}

variable "token_no_default_policy" {
  type    = bool
  default = true
}

variable "token_num_uses" {
  type    = number
  default = 3
}

variable "engine_path" {
  type = string
}

variable "data" {
  type      = map(string)
  sensitive = true
}
