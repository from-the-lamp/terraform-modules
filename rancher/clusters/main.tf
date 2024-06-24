resource "rancher2_cluster" "template" {
  for_each    = toset(var.clusters)
  name        = each.key
  description = "iac"
}
