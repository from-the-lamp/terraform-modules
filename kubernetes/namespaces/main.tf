resource "kubernetes_namespace" "template" {
  for_each = var.namespaces
    metadata {
      name = each.key
      labels = {
        for label in each.value.labels: label.label => label.value
      }
    }
}
