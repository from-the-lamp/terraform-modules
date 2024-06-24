variable "api_url" {
  type = string
}

variable "token_key" {
  type      = string
  sensitive = true
}

variable "clusters" {
  type = list(string)
}
