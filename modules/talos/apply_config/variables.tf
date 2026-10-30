variable "node" {
  type        = string
  description = "The IP address of the node to apply the machine configuration to."
}

variable "machine_configuration" {
  type        = string
  sensitive   = true
  description = "The full rendered machine configuration YAML (from talos/machine_configuration), applied in place without replacing the node."
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

variable "mode" {
  type        = string
  default     = "auto"
  description = "talosctl apply-config --mode. \"staged\" writes the config but defers activation to the next reboot - use for changes (e.g. network identity) that would otherwise cut off the node before it can confirm reachability."
}
