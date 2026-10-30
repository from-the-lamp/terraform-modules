variable "helm_release_name" {
  type        = string
  default     = "base"
  description = "The name of the Helm release."
}

variable "helm_repo_url" {
  type        = string
  default     = ""
  description = "The URL of the Helm chart repository."
}

variable "helm_repo_user" {
  type        = string
  default     = ""
  description = "The username for the Helm chart repository, if required."
}

variable "helm_repo_pass" {
  type        = string
  sensitive   = true
  default     = ""
  description = "The password for the Helm chart repository, if required."
}

variable "helm_chart_name" {
  type        = string
  default     = "./chart"
  description = "The name or path of the Helm chart."
}

variable "helm_chart_version" {
  type        = string
  default     = "0.0.1"
  description = "The version of the Helm chart."
}

variable "virtual_service_chart_name" {
  type        = string
  default     = "istio-gateway"
  description = "The name of the Helm chart for the virtual service."
}

variable "virtual_service_chart_version" {
  type        = string
  default     = "0.0.1"
  description = "The version of the Helm chart for the virtual service."
}

variable "is_host_external" {
  type        = bool
  default     = true
  description = "A flag indicating whether the host is external."
}

variable "helm_values" {
  type        = list(any)
  default     = []
  description = "A list of Helm values files content to apply to the release."
}

variable "helm_namespace" {
  type        = string
  default     = "infra"
  description = "The Kubernetes namespace for the Helm release."
}

variable "helm_create_namespace" {
  type        = bool
  default     = false
  description = "A flag indicating whether to create the Kubernetes namespace if it doesn't exist."
}

variable "helm_set_sensitive" {
  type        = map(any)
  default     = {}
  description = "A map of sensitive values to set in the Helm chart."
}

variable "helm_force_update" {
  type        = bool
  default     = true
  description = "A flag indicating whether to force update the Helm release."
}

variable "helm_recreate_pods" {
  type        = bool
  default     = true
  description = "A flag indicating whether to recreate pods when updating the Helm release."
}

variable "helm_reuse_values" {
  type        = bool
  default     = false
  description = "A flag indicating whether to reuse values from the previous release."
}

variable "disable_openapi_validation" {
  type        = bool
  default     = true
  description = "A flag indicating whether to disable OpenAPI validation."
}

variable "oci_registry_url" {
  type        = string
  default     = ""
  description = "The URL of the OCI registry."
}

variable "oci_registry_username" {
  type        = string
  default     = ""
  description = "The username for the OCI registry."
}

variable "oci_registry_password" {
  type        = string
  sensitive   = true
  default     = ""
  description = "The password for the OCI registry."
}
