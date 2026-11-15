FTL-176: a GitLab Pipeline Hook (`pipeline_events` only) pointed at `ingest-gitlab`'s own
`/webhook/gitlab`, so a failed pipeline on an agent-authored merge request is reacted to
immediately instead of waiting for the next poll cycle.

The webhook's shared token (what GitLab sends back as `X-Gitlab-Token`, verified by the receiving
adapter) is read from Vault rather than passed in as a plain input - same "never hardcode a secret
in a terragrunt unit's inputs" reasoning as `litellm/virtual_key`. This module only reads that
secret (`vault_mount`/`vault_secret_path`/`vault_property`); it does not create or rotate it - the
secret must already exist at that Vault path before the first apply.

Caller must configure both the `gitlab` provider and the `vault` provider.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | ~> 19.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 4.6.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | ~> 19.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [gitlab_project_hook.pipeline](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_hook) | resource |
| [vault_kv_secret_v2.shared](https://registry.terraform.io/providers/hashicorp/vault/4.6.0/docs/data-sources/kv_secret_v2) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_enable_ssl_verification"></a> [enable\_ssl\_verification](#input\_enable\_ssl\_verification) | Whether GitLab verifies this webhook endpoint's TLS certificate before sending events. | `bool` | `true` | no |
| <a name="input_pipeline_events"></a> [pipeline\_events](#input\_pipeline\_events) | Whether to send pipeline events to url. | `bool` | `true` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID or full path of the project this webhook is created on (e.g. "from-the-lamp/infra/helm-charts"). | `string` | n/a | yes |
| <a name="input_url"></a> [url](#input\_url) | URL GitLab sends the webhook's events to. | `string` | n/a | yes |
| <a name="input_vault_mount"></a> [vault\_mount](#input\_vault\_mount) | Vault KV-v2 mount the webhook token is read from. | `string` | `"platform"` | no |
| <a name="input_vault_property"></a> [vault\_property](#input\_vault\_property) | Property name within vault\_mount/vault\_secret\_path holding the webhook token. | `string` | n/a | yes |
| <a name="input_vault_secret_path"></a> [vault\_secret\_path](#input\_vault\_secret\_path) | Secret path within vault\_mount holding the webhook token, e.g. "gitlab". | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The webhook's numeric ID. |
<!-- END_TF_DOCS -->
