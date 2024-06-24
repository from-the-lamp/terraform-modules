resource "digitalocean_kubernetes_node_pool" "template" {
  cluster_id = var.cluster_id
  name       = var.node_pool_name
  size       = var.node_pool_size
  node_count = var.node_pool_count
  tags       = var.tags
  labels     = var.labels
  dynamic "taint" {
    for_each = var.node_pool_taint
    content {
      key    = taint.key
      value  = taint.value
      effect = taint.value
    }
  }
}
