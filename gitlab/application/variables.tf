variable "app_name" {
  type        = string
  description = "The name of the application."
}

variable "redirect_url" {
  type        = string
  description = "The URL to which the user will be redirected after authentication."
}

variable "scopes" {
  type        = list(string)
  default     = ["openid"]
  description = "A list of scopes that the application will request."
}

variable "confidential" {
  type        = bool
  default     = true
  description = "A flag indicating whether the application is confidential."
}
