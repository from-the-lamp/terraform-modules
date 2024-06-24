variable "cluster_name" {
  type        = string
  description = "The name of the Kubernetes cluster."
}

variable "cluster_region" {
  type        = string
  description = "The region where the Kubernetes cluster will be deployed."
}

variable "cluster_version" {
  type        = string
  default     = "1.27.4-do.0"
  description = "The version of the Kubernetes cluster, defaulting to '1.27.4-do.0'."
}

variable "node_pool_name" {
  type        = string
  description = "The name of the node pool within the Kubernetes cluster."
}

variable "node_pool_size" {
  type        = string
  default     = "s-1vcpu-512mb-10gb"
  description = "The size of the nodes in the pool, defaulting to 's-1vcpu-512mb-10gb'."
}

variable "node_pool_count" {
  type        = number
  default     = 1
  description = "The number of nodes in the pool, defaulting to 1."
}

variable "node_pool_taint" {
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default     = []
  description = "A list of taints to apply to the nodes in the pool, each containing a key, value, and effect."
}
