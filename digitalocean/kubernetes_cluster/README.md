## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | 2.39.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.39.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.template](https://registry.terraform.io/providers/digitalocean/digitalocean/2.39.2/docs/resources/kubernetes_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The region where the Kubernetes cluster will be deployed. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of the Kubernetes cluster. | `string` | `"1.27.4-do.0"` | no |
| <a name="input_node_pool_count"></a> [node\_pool\_count](#input\_node\_pool\_count) | The number of nodes in the pool. | `number` | `1` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | The name of the node pool within the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_node_pool_size"></a> [node\_pool\_size](#input\_node\_pool\_size) | The size of the nodes in the pool. | `string` | `"s-1vcpu-512mb-10gb"` | no |
| <a name="input_node_pool_taint"></a> [node\_pool\_taint](#input\_node\_pool\_taint) | A list of taints to apply to the nodes in the pool, each containing a key, value, and effect. | <pre>list(object({<br>    key    = string<br>    value  = string<br>    effect = string<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
