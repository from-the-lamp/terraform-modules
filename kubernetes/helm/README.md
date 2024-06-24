## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.template](https://registry.terraform.io/providers/hashicorp/helm/2.14.0/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_openapi_validation"></a> [disable\_openapi\_validation](#input\_disable\_openapi\_validation) | A flag indicating whether to disable OpenAPI validation. | `bool` | `true` | no |
| <a name="input_helm_chart_name"></a> [helm\_chart\_name](#input\_helm\_chart\_name) | The name or path of the Helm chart. | `string` | `"./chart"` | no |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | The version of the Helm chart. | `string` | `"0.0.1"` | no |
| <a name="input_helm_force_update"></a> [helm\_force\_update](#input\_helm\_force\_update) | A flag indicating whether to force update the Helm release. | `bool` | `true` | no |
| <a name="input_helm_recreate_pods"></a> [helm\_recreate\_pods](#input\_helm\_recreate\_pods) | A flag indicating whether to recreate pods when updating the Helm release. | `bool` | `true` | no |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | The name of the Helm release. | `string` | `"base"` | no |
| <a name="input_helm_repo_pass"></a> [helm\_repo\_pass](#input\_helm\_repo\_pass) | The password for the Helm chart repository, if required. | `string` | `""` | no |
| <a name="input_helm_repo_url"></a> [helm\_repo\_url](#input\_helm\_repo\_url) | The URL of the Helm chart repository. | `string` | `"https://repo.url"` | no |
| <a name="input_helm_repo_user"></a> [helm\_repo\_user](#input\_helm\_repo\_user) | The username for the Helm chart repository, if required. | `string` | `""` | no |
| <a name="input_helm_reuse_values"></a> [helm\_reuse\_values](#input\_helm\_reuse\_values) | A flag indicating whether to reuse values from the previous release. | `bool` | `false` | no |
| <a name="input_helm_set_sensitive"></a> [helm\_set\_sensitive](#input\_helm\_set\_sensitive) | A map of sensitive values to set in the Helm chart. | `map(any)` | `{}` | no |
| <a name="input_helm_values_file"></a> [helm\_values\_file](#input\_helm\_values\_file) | The path to the Helm values file. | `string` | `""` | no |
| <a name="input_is_host_external"></a> [is\_host\_external](#input\_is\_host\_external) | A flag indicating whether the host is external. | `bool` | `true` | no |
| <a name="input_k8s_create_namespace"></a> [k8s\_create\_namespace](#input\_k8s\_create\_namespace) | A flag indicating whether to create the Kubernetes namespace if it doesn't exist. | `bool` | `true` | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | The Kubernetes namespace for the Helm release. | `string` | `"infra"` | no |
| <a name="input_oci_registry_password"></a> [oci\_registry\_password](#input\_oci\_registry\_password) | The password for the OCI registry. | `string` | `""` | no |
| <a name="input_oci_registry_url"></a> [oci\_registry\_url](#input\_oci\_registry\_url) | The URL of the OCI registry. | `string` | `""` | no |
| <a name="input_oci_registry_username"></a> [oci\_registry\_username](#input\_oci\_registry\_username) | The username for the OCI registry. | `string` | `""` | no |
| <a name="input_virtual_service_chart_name"></a> [virtual\_service\_chart\_name](#input\_virtual\_service\_chart\_name) | The name of the Helm chart for the virtual service. | `string` | `"istio-gateway"` | no |
| <a name="input_virtual_service_chart_version"></a> [virtual\_service\_chart\_version](#input\_virtual\_service\_chart\_version) | The version of the Helm chart for the virtual service. | `string` | `"0.0.1"` | no |

## Outputs

No outputs.
