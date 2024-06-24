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
| [digitalocean_kubernetes_node_pool.template](https://registry.terraform.io/providers/digitalocean/digitalocean/2.39.2/docs/resources/kubernetes_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of labels to apply to the node pool. | `map(string)` | `{}` | no |
| <a name="input_node_pool_count"></a> [node\_pool\_count](#input\_node\_pool\_count) | The number of nodes in the pool. | `number` | `1` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | The name of the node pool within the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_node_pool_size"></a> [node\_pool\_size](#input\_node\_pool\_size) | The size of the nodes in the pool. | `string` | `"s-1vcpu-512mb-10gb"` | no |
| <a name="input_node_pool_taint"></a> [node\_pool\_taint](#input\_node\_pool\_taint) | A list of taints to apply to the nodes in the pool, each containing a key, value, and effect. | <pre>list(object({<br>    key    = string<br>    value  = string<br>    effect = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tags to apply to the node pool. | `list(any)` | <pre>[<br>  "terraform"<br>]</pre> | no |

## Outputs

No outputs.
