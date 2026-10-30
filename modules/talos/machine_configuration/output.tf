output "machine_configuration" {
  value     = data.talos_machine_configuration.template.machine_configuration
  sensitive = true
}
