variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

variable "cloudflare_zone_name" {
  type        = string
  description = "Cloudflare Zone name"
}

variable "cloudflare_token_name" {
  type        = string
  description = "Cloudflare Token name"
}
