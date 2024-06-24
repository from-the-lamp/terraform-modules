resource "digitalocean_kubernetes_cluster" "template" {
  name    = var.cluster_name
  region  = var.cluster_region
  version = var.cluster_version

  node_pool {
    name       = var.node_pool_name
    size       = var.node_pool_size
    node_count = var.node_pool_count

    dynamic "taint" {
      for_each = var.node_pool_taint
      content {
        key    = taint.key
        value  = taint.value
        effect = taint.value
      }
    }
  }
}
