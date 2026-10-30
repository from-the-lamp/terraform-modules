output "talos_config" {
  value     = data.talos_client_configuration.template.talos_config
  sensitive = true
}

output "kubeconfig_raw" {
  value     = talos_cluster_kubeconfig.template.kubeconfig_raw
  sensitive = true
}

output "kubernetes_client_configuration" {
  value     = talos_cluster_kubeconfig.template.kubernetes_client_configuration
  sensitive = true
}

output "kubernetes_ca_certificate" {
  value     = base64decode(talos_cluster_kubeconfig.template.kubernetes_client_configuration.ca_certificate)
  sensitive = true
}
