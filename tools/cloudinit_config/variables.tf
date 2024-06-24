variable "content" {
  type        = string
  description = "The content to be processed, typically a script or configuration."
}

variable "vars" {
  type        = map(any)
  description = "A map of variables to be substituted into the content."
}

variable "gzip" {
  type        = bool
  default     = true
  description = "Whether to gzip the content."
}

variable "base64_encode" {
  type        = bool
  default     = true
  description = "Whether to Base64 encode the content."
}

variable "content_type" {
  type        = string
  default     = "text/x-shellscript"
  description = "The MIME type of the content."
}
