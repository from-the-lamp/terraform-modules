variable "cloudflare_zone_name" {
  type        = string
  description = "The name of the DNS zone in Cloudflare."
}

variable "external_records" {
  type        = list(any)
  default     = []
  description = "A list of external DNS records to be managed by Cloudflare."
}

variable "internal_records" {
  type        = list(any)
  default     = []
  description = "A list of internal DNS records to be managed by Cloudflare."
}

variable "external_lb_svc_name" {
  type        = string
  default     = "istio-ingressgateway"
  description = "The name of the external load balancer service."
}

variable "external_lb_svc_namespace" {
  type        = string
  default     = "istio-system"
  description = "The namespace of the external load balancer service."
}

variable "internal_lb_svc_name" {
  type        = string
  default     = "istio-ingressgateway-internal"
  description = "The name of the internal load balancer service."
}

variable "internal_lb_svc_namespace" {
  type        = string
  default     = "istio-system"
  description = "The namespace of the internal load balancer service."
}

variable "cloudflare_record_comment" {
  type        = string
  default     = "terraform=true"
  description = "A comment to add to the Cloudflare DNS records."
}

variable "internal_load_balancer" {
  type        = bool
  default     = false
  description = "A flag indicating whether to use an internal load balancer."
}

variable "external_load_balancer" {
  type        = bool
  default     = false
  description = "A flag indicating whether to use an external load balancer."
}
