resource "tailscale_acl" "template" {
  acl = jsonencode({
    tagOwners = var.tag_owners
    autoApprovers = {
      routes   = var.auto_approvers_routes
      exitNode = var.auto_approvers_exit_node
    }
    grants = var.grants
    ssh    = var.ssh
  })

  overwrite_existing_content = var.overwrite_existing_content
  reset_acl_on_destroy       = var.reset_acl_on_destroy
}
