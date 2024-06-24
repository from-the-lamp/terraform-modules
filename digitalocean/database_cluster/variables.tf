variable "cluster_name" {
  type        = string
  description = "The name of the database cluster."
}

variable "cluster_engine" {
  type        = string
  default     = "pg"
  description = "The database engine for the cluster, defaulting to 'pg' for PostgreSQL."
}

variable "cluster_version" {
  type        = string
  default     = "14"
  description = "The version of the database engine, defaulting to version '14'."
}

variable "cluster_size" {
  type        = string
  default     = "db-s-1vcpu-1gb"
  description = "The size of the database cluster, defaulting to 'db-s-1vcpu-1gb'."
}

variable "cluster_region" {
  type        = string
  description = "The region where the database cluster will be deployed."
}

variable "cluster_node_count" {
  type        = number
  default     = 1
  description = "The number of nodes in the database cluster, defaulting to 1."
}
