variable "do_token" {
  type      = string
  sensitive = true
}

variable "cluster_name" {
  type = string
}

variable "cluster_engine" {
  type    = string
  default = "pg"
}

variable "cluster_version" {
  type    = string
  default = "14"
}

variable "cluster_size" {
  type    = string
  default = "db-s-1vcpu-1gb"
}

variable "cluster_region" {
  type = string
}

variable "cluster_node_count" {
  type    = number
  default = 1
}
