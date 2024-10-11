resource "cloudflare_fallback_domain" "template" {
  count      = length(var.private_domains) > 0 ? 1 : 0
  account_id = var.account_id
  dynamic "domains" {
    for_each = var.private_domains
    content {
      suffix      = domains.value.suffix
      description = domains.value.description
      dns_server  = domains.value.dns_servers
    }
  }
}
