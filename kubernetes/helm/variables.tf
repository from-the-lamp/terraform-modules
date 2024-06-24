variable "host" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "helm_release_name" {
  type    = string
  default = "base"
}

variable "helm_repo_url" {
  type    = string
  default = "https://repo.url"
}

variable "helm_repo_user" {
  type    = string
  default = ""
}

variable "helm_repo_pass" {
  type      = string
  sensitive = true
  default   = ""
}

variable "helm_chart_name" {
  type    = string
  default = "./chart"
}

variable "helm_chart_version" {
  type    = string
  default = "0.0.1"
}

variable "virtual_service_chart_name" {
  type    = string
  default = "istio-gateway"
}

variable "virtual_service_chart_version" {
  type    = string
  default = "0.0.1"
}

variable "is_host_external" {
  type    = bool
  default = true
}

variable "helm_values_file" {
  type    = string
  default = ""
}

variable "k8s_namespace" {
  type    = string
  default = "infra"
}

variable "k8s_create_namespace" {
  type    = bool
  default = true
}

variable "helm_set_sensitive" {
  type      = map
  default   = {}
}
variable "helm_force_update" {
  type    = bool
  default = true
}
variable "helm_recreate_pods" {
  type    = bool
  default = true
}

variable "helm_reuse_values" {
  type    = bool
  default = false
}

variable "disable_openapi_validation" {
  type    = bool
  default = true
}

variable "oci_registry_url" {
  type    = string
  default = ""
}

variable "oci_registry_username" {
  type    = string
  default = ""
}

variable "oci_registry_password" {
  type    = string
  default = ""
}
