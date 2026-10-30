output "config" {
  value     = data.cloudinit_config.template
  sensitive = true
}
