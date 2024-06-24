locals {
  domain      = var.cloudflare_zone_name
  domain_name = trimsuffix(local.domain, ".")
}

data "cloudflare_zone" "template" {
  name = local.domain_name
}

module "acm" {
  source                    = "git::https://github.com/terraform-aws-modules/terraform-aws-acm"
  domain_name               = local.domain_name
  zone_id                   = data.cloudflare_zone.template.id
  subject_alternative_names = var.internal_records
  create_route53_records    = false
  validation_record_fqdns   = cloudflare_record.validation[*].hostname
}

resource "cloudflare_record" "validation" {
  count           = length(module.acm.distinct_domain_names)
  zone_id         = data.cloudflare_zone.template.id
  name            = element(module.acm.validation_domains, count.index)["resource_record_name"]
  type            = element(module.acm.validation_domains, count.index)["resource_record_type"]
  value           = trimsuffix(element(module.acm.validation_domains, count.index)["resource_record_value"], ".")
  ttl             = 60
  proxied         = false
  allow_overwrite = true
}

data "kubernetes_service" "external_load_balancer" {
  count = "${var.external_load_balancer}" ? 1 : 0
  metadata {
    name      = var.external_lb_svc_name
    namespace = var.external_lb_svc_namespace
  }
}

data "kubernetes_service" "internal_load_balancer" {
  count = "${var.internal_load_balancer}" ? 1 : 0
  metadata {
    name      = var.internal_lb_svc_name
    namespace = var.internal_lb_svc_namespace
  }
}

resource "cloudflare_record" "external" {
  for_each = toset(var.external_records)
  zone_id  = data.cloudflare_zone.template.id
  name     = each.key
  value    = data.kubernetes_service.external_load_balancer[0].status[0].load_balancer[0].ingress[0].ip
  type     = "CNAME"
  proxied  = true
  ttl      = 1
  comment  = var.cloudflare_record_comment
}
resource "cloudflare_record" "internal" {
  for_each = var.internal_load_balancer ? toset(var.internal_records) : []
  zone_id  = data.cloudflare_zone.template.id
  name     = each.key
  value    = data.kubernetes_service.internal_load_balancer[0].status[0].load_balancer[0].ingress[0].hostname
  type     = "CNAME"
  proxied  = false
  ttl      = 1
  comment  = var.cloudflare_record_comment
}
