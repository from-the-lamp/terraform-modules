resource "digitalocean_database_cluster" "template" {
  name       = var.cluster_name
  engine     = var.cluster_engine
  version    = var.cluster_version
  size       = var.cluster_size
  region     = var.cluster_region
  node_count = var.cluster_node_count
}
