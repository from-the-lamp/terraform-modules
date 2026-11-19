resource "oneuptime_workflow" "this" {
  name        = var.name
  description = var.description
  is_enabled  = var.is_enabled
  graph       = jsonencode(var.graph)
}
