variable "node" {
  type        = string
  description = "The IP address of the node to upgrade."
}

variable "installer_image" {
  type        = string
  description = "The Talos installer image reference to upgrade to, e.g. factory.talos.dev/installer/<schematic>:v1.9.1."
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

variable "timeout" {
  type        = string
  default     = "20m"
  description = "How long talosctl waits for the upgrade to complete."
}

variable "reboot_mode" {
  type        = string
  default     = "default"
  description = "talosctl upgrade --reboot-mode. \"powercycle\" bypasses kexec - needed on hardware where kexec silently fails to actually reboot into the new image."
}
