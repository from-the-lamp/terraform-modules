resource "talos_machine_secrets" "template" {
  talos_version = var.talos_version

  # This holds the cluster's root PKI: destroying it invalidates every node's Talos identity and etcd's trust. If a future Talos major version ever makes this resource ForceNew, apply will fail loudly here rather than silently destroying secrets, which is the intended safety behavior.
  lifecycle {
    prevent_destroy = true
  }
}
