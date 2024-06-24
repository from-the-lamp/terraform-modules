variable "do_token" {
  type      = string
  sensitive = true
}

variable "cluster_name" {
  type = string
}

variable "cluster_region" {
  type = string
}

variable "cluster_version" {
  type    = string
  default = "1.27.4-do.0"
}

variable "node_pool_name" {
  type = string
}

variable "node_pool_size" {
  type    = string
  default = "s-1vcpu-512mb-10gb"
}

variable "node_pool_count" {
  type    = number
  default = 1
}

variable "node_pool_taint" {
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}
