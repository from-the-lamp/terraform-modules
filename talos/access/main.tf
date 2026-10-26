data "talos_client_configuration" "template" {
  cluster_name         = var.cluster_name
  client_configuration = var.client_configuration
  nodes                = var.nodes
  endpoints            = var.nodes
}

# Hetzner can reassign the same IP to a replaced server, so bootstrap_node
# alone doesn't change when the underlying VM does. This resource exists only
# so talos_machine_bootstrap/talos_cluster_kubeconfig can replace_triggered_by
# it and re-run against the new VM instead of silently staying bootstrapped
# against a VM that no longer exists.
resource "terraform_data" "bootstrap_node_identity" {
  input = var.bootstrap_node_id
}

resource "talos_machine_bootstrap" "template" {
  node                 = var.bootstrap_node
  endpoint             = var.bootstrap_node
  client_configuration = var.client_configuration

  timeouts = {
    create = "10m"
  }

  lifecycle {
    replace_triggered_by = [terraform_data.bootstrap_node_identity]
  }
}

resource "talos_cluster_kubeconfig" "template" {
  node                 = var.bootstrap_node
  endpoint             = var.bootstrap_node
  client_configuration = var.client_configuration

  timeouts = {
    create = "10m"
  }

  lifecycle {
    replace_triggered_by = [terraform_data.bootstrap_node_identity]
  }

  depends_on = [talos_machine_bootstrap.template]
}
