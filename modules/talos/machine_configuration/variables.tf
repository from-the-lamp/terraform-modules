variable "cluster_name" {
  type        = string
  description = "The name of the Talos cluster."
}

variable "cluster_endpoint" {
  type        = string
  description = "The Kubernetes API endpoint clients and nodes use, e.g. https://<load-balancer-ip>:6443."
}

variable "machine_type" {
  type        = string
  default     = "controlplane"
  description = "The machine type: 'controlplane' or 'worker'."
}

variable "machine_secrets" {
  type = object({
    certs = object({
      etcd = object({
        cert = string
        key  = string
      })
      k8s = object({
        cert = string
        key  = string
      })
      k8s_aggregator = object({
        cert = string
        key  = string
      })
      k8s_serviceaccount = object({
        key = string
      })
      os = object({
        cert = string
        key  = string
      })
    })
    cluster = object({
      id     = string
      secret = string
    })
    secrets = object({
      aescbc_encryption_secret    = string
      bootstrap_token             = string
      secretbox_encryption_secret = string
    })
    trustdinfo = object({
      token = string
    })
  })
  sensitive   = true
  description = "The machine_secrets object from the talos/secrets module."
}

variable "talos_version" {
  type        = string
  default     = null
  description = "The Talos version to render the machine configuration for."
}

variable "kubernetes_version" {
  type        = string
  default     = null
  description = "The Kubernetes version to install."
}

variable "config_patches" {
  type        = list(string)
  default     = []
  description = "A list of YAML machine config patches (e.g. from yamlencode())."
}
