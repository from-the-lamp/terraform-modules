## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.55.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.35.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.31.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | git::https://github.com/terraform-aws-modules/terraform-aws-acm | n/a |

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.external](https://registry.terraform.io/providers/cloudflare/cloudflare/4.35.0/docs/resources/record) | resource |
| [cloudflare_record.internal](https://registry.terraform.io/providers/cloudflare/cloudflare/4.35.0/docs/resources/record) | resource |
| [cloudflare_record.validation](https://registry.terraform.io/providers/cloudflare/cloudflare/4.35.0/docs/resources/record) | resource |
| [cloudflare_zone.template](https://registry.terraform.io/providers/cloudflare/cloudflare/4.35.0/docs/data-sources/zone) | data source |
| [kubernetes_service.external_load_balancer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |
| [kubernetes_service.internal_load_balancer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_record_comment"></a> [cloudflare\_record\_comment](#input\_cloudflare\_record\_comment) | A comment to add to the Cloudflare DNS records. | `string` | `"terraform=true"` | no |
| <a name="input_cloudflare_zone_name"></a> [cloudflare\_zone\_name](#input\_cloudflare\_zone\_name) | The name of the DNS zone in Cloudflare. | `string` | n/a | yes |
| <a name="input_external_lb_svc_name"></a> [external\_lb\_svc\_name](#input\_external\_lb\_svc\_name) | The name of the external load balancer service. | `string` | `"istio-ingressgateway"` | no |
| <a name="input_external_lb_svc_namespace"></a> [external\_lb\_svc\_namespace](#input\_external\_lb\_svc\_namespace) | The namespace of the external load balancer service. | `string` | `"istio-system"` | no |
| <a name="input_external_load_balancer"></a> [external\_load\_balancer](#input\_external\_load\_balancer) | A flag indicating whether to use an external load balancer. | `bool` | `false` | no |
| <a name="input_external_records"></a> [external\_records](#input\_external\_records) | A list of external DNS records to be managed by Cloudflare. | `list(any)` | `[]` | no |
| <a name="input_internal_lb_svc_name"></a> [internal\_lb\_svc\_name](#input\_internal\_lb\_svc\_name) | The name of the internal load balancer service. | `string` | `"istio-ingressgateway-internal"` | no |
| <a name="input_internal_lb_svc_namespace"></a> [internal\_lb\_svc\_namespace](#input\_internal\_lb\_svc\_namespace) | The namespace of the internal load balancer service. | `string` | `"istio-system"` | no |
| <a name="input_internal_load_balancer"></a> [internal\_load\_balancer](#input\_internal\_load\_balancer) | A flag indicating whether to use an internal load balancer. | `bool` | `false` | no |
| <a name="input_internal_records"></a> [internal\_records](#input\_internal\_records) | A list of internal DNS records to be managed by Cloudflare. | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#output\_cloudflare\_zone\_id) | n/a |
