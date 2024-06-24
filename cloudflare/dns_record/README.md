## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 3.32.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.32.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.template](https://registry.terraform.io/providers/cloudflare/cloudflare/3.32.0/docs/resources/record) | resource |
| [cloudflare_zone.template](https://registry.terraform.io/providers/cloudflare/cloudflare/3.32.0/docs/data-sources/zone) | data source |
| [kubernetes_service.external_load_balancer](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/data-sources/service) | data source |
| [kubernetes_service.internal_load_balancer](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | Kubernetes Client certificate | `string` | `null` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | Kubernetes Client key | `string` | `null` | no |
| <a name="input_cloudflare-records"></a> [cloudflare-records](#input\_cloudflare-records) | A list of DNS record objects | <pre>list(object({<br>    name    = string<br>    address = optional(string)<br>    type    = string<br>    proxied = bool<br>    ttl     = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API Token | `string` | n/a | yes |
| <a name="input_cloudflare_zone_name"></a> [cloudflare\_zone\_name](#input\_cloudflare\_zone\_name) | Cloudflare Zone name | `string` | n/a | yes |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | Kubernetes CA certificate | `string` | `null` | no |
| <a name="input_external_lb_svc_name"></a> [external\_lb\_svc\_name](#input\_external\_lb\_svc\_name) | External load balancer kubernetes service name | `string` | `"istio-ingressgateway"` | no |
| <a name="input_external_lb_svc_namespace"></a> [external\_lb\_svc\_namespace](#input\_external\_lb\_svc\_namespace) | External load balancer kubernetes service namespace | `string` | `"istio-system"` | no |
| <a name="input_external_load_balancer"></a> [external\_load\_balancer](#input\_external\_load\_balancer) | Is external load balancer enabled? | `bool` | `false` | no |
| <a name="input_host"></a> [host](#input\_host) | Kubernetes Host | `string` | `null` | no |
| <a name="input_internal_lb_svc_name"></a> [internal\_lb\_svc\_name](#input\_internal\_lb\_svc\_name) | Internal load balancer kubernetes service name | `string` | `"istio-ingressgateway-internal"` | no |
| <a name="input_internal_lb_svc_namespace"></a> [internal\_lb\_svc\_namespace](#input\_internal\_lb\_svc\_namespace) | Internal load balancer kubernetes service namespace | `string` | `"istio-system"` | no |
| <a name="input_internal_load_balancer"></a> [internal\_load\_balancer](#input\_internal\_load\_balancer) | Is internal load balancer enabled? | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#output\_cloudflare\_zone\_id) | n/a |
