variable "node" {
  type        = string
  description = "The IP address of any control plane node to send the upgrade API call to. talosctl discovers and upgrades every node in the cluster from there."
}

variable "kubernetes_version" {
  type        = string
  description = "The target Kubernetes version, e.g. 1.32.0 (no leading 'v')."
}

variable "client_configuration" {
  type = object({
    ca_certificate     = string
    client_certificate = string
    client_key         = string
  })
  sensitive   = true
  description = "The client PKI material from the talos/secrets module."
}
