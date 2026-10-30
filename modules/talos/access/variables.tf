variable "cluster_name" {
  type        = string
  description = "The name of the Talos cluster."
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

variable "nodes" {
  type        = list(string)
  description = "The IP addresses of every control plane node, used as the default talosctl target set."
}

variable "bootstrap_node" {
  type        = string
  description = "The IP address of the control plane node etcd is bootstrapped on and the kubeconfig is fetched from."
}

variable "bootstrap_node_id" {
  type        = string
  description = "The cloud provider's server ID for the bootstrap node. Used only to force re-bootstrap when the underlying server is replaced, even if it keeps the same IP."
}
