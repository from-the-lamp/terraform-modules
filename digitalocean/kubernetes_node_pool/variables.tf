variable "do_token" {
  type      = string
  sensitive = true
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

variable "cluster_id" {
  type = string
}

variable "tags" {
  type    = list(any)
  default = ["terraform"]
}

variable "labels" {
  type    = map(string)
  default = {}
}
