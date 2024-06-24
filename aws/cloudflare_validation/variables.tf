variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_name" {
  type      = string
}

variable "external_records" {
  type      = list
  default   = []
}

variable "internal_records" {
  type      = list
  default   = []
}

variable "external_lb_svc_name" {
  type    = string
  default = "istio-ingressgateway"
}

variable "external_lb_svc_namespace" {
  type    = string
  default = "istio-system"
}

variable "internal_lb_svc_name" {
  type    = string
  default = "istio-ingressgateway-internal"
}

variable "internal_lb_svc_namespace" {
  type    = string
  default = "istio-system"
}

variable "cloudflare_record_comment" {
  type    = string
  default = "terraform=true"
}

variable "internal_load_balancer" {
  type    = bool
  default = false
}

variable "external_load_balancer" {
  type    = bool
  default = false
}
