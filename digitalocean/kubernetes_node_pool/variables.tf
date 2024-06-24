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

variable "cluster_id" {
  type        = string
  description = "The ID of the Kubernetes cluster."
}

variable "tags" {
  type        = list(any)
  default     = ["terraform"]
  description = "A list of tags to apply to the node pool, defaulting to ['terraform']."
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "A map of labels to apply to the node pool."
}
