resource "kubernetes_manifest" "template" {
  for_each = { for idx, content in var.manifests : idx => content }
  manifest = yamldecode(each.value)
}
