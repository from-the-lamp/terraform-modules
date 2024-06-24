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
| [digitalocean_database_cluster.template](https://registry.terraform.io/providers/digitalocean/digitalocean/2.39.2/docs/resources/database_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_engine"></a> [cluster\_engine](#input\_cluster\_engine) | The database engine for the cluster. | `string` | `"pg"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the database cluster. | `string` | n/a | yes |
| <a name="input_cluster_node_count"></a> [cluster\_node\_count](#input\_cluster\_node\_count) | The number of nodes in the database cluster. | `number` | `1` | no |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The region where the database cluster will be deployed. | `string` | n/a | yes |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | The size of the database cluster. | `string` | `"db-s-1vcpu-1gb"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of the database engine. | `string` | `"14"` | no |

## Outputs

No outputs.
