variable "content" {
  type = string
}

variable "vars" {
  type = map(any)
}

variable "gzip" {
  type    = bool
  default = true
}

variable "base64_encode" {
  type    = bool
  default = true
}

variable "content_type" {
  type    = string
  default = "text/x-shellscript"
}
