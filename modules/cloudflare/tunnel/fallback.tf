resource "cloudflare_zero_trust_device_default_profile_local_domain_fallback" "template" {
  count      = length(var.private_domains) > 0 ? 1 : 0
  account_id = var.account_id
  domains = [
    for domain in var.private_domains : {
      suffix      = domain.suffix
      description = domain.description
      dns_server  = domain.dns_servers
    }
  ]
}
