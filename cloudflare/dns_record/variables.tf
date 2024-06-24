variable "host" {
  type        = string
  default     = null
  description = "Kubernetes Host"
}

variable "cluster_ca_certificate" {
  type        = string
  default     = null
  description = "Kubernetes CA certificate"
}

variable "client_certificate" {
  type        = string
  default     = null
  description = "Kubernetes Client certificate"
}

variable "client_key" {
  type        = string
  default     = null
  description = "Kubernetes Client key"
}

variable "cloudflare_zone_name" {
  type        = string
  description = "Cloudflare Zone name"
}

variable "cloudflare-records" {
  type = list(object({
    name    = string
    address = optional(string)
    type    = string
    proxied = bool
    ttl     = optional(string)
  }))
  default     = []
  description = "A list of DNS record objects"
}

variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

variable "internal_load_balancer" {
  type        = bool
  default     = false
  description = "Is internal load balancer enabled?"
}

variable "external_load_balancer" {
  type        = bool
  default     = false
  description = "Is external load balancer enabled?"
}

variable "external_lb_svc_name" {
  type        = string
  default     = "istio-ingressgateway"
  description = "External load balancer kubernetes service name"
}

variable "external_lb_svc_namespace" {
  type        = string
  default     = "istio-system"
  description = "External load balancer kubernetes service namespace"
}

variable "internal_lb_svc_name" {
  type        = string
  default     = "istio-ingressgateway-internal"
  description = "Internal load balancer kubernetes service name"
}

variable "internal_lb_svc_namespace" {
  type        = string
  default     = "istio-system"
  description = "Internal load balancer kubernetes service namespace"
}
