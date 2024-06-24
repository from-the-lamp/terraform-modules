data "cloudflare_zone" "template" {
  name = var.cloudflare_zone_name
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

resource "cloudflare_record" "template" {
  for_each = { for record in var.cloudflare-records : record.name => record }
  zone_id  = data.cloudflare_zone.template.id
  name     = each.value.name
  value    = data.kubernetes_service.external_load_balancer[0].status[0].load_balancer[0].ingress[0].ip
  type     = each.value.type
  proxied  = each.value.proxied
  ttl      = each.value.proxied ? "1" : each.value.ttl
}
