resource "tailscale_dns_configuration" "template" {
  magic_dns          = var.magic_dns
  override_local_dns = var.override_local_dns

  dynamic "nameservers" {
    for_each = var.global_nameservers
    content {
      address            = nameservers.value.address
      use_with_exit_node = nameservers.value.use_with_exit_node
    }
  }

  dynamic "split_dns" {
    for_each = var.split_dns
    content {
      domain = split_dns.value.domain

      dynamic "nameservers" {
        for_each = split_dns.value.nameservers
        content {
          address            = nameservers.value.address
          use_with_exit_node = nameservers.value.use_with_exit_node
        }
      }
    }
  }
}
