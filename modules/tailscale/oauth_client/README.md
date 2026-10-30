## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_tailscale"></a> [tailscale](#requirement\_tailscale) | ~> 0.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tailscale"></a> [tailscale](#provider\_tailscale) | ~> 0.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tailscale_oauth_client.template](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/oauth_client) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the OAuth client (alphanumeric characters only) | `string` | n/a | yes |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | OAuth scopes to grant the client, see https://tailscale.com/kb/1623/ | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags the client's access tokens are allowed to assign to devices. Required if scopes include devices:core or auth\_keys | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | The OAuth client ID |
| <a name="output_client_secret"></a> [client\_secret](#output\_client\_secret) | The OAuth client secret |

## Notes

- This is the equivalent of the Cloudflare tunnel module's `data.cloudflare_zero_trust_tunnel_cloudflared_token`: it produces the credential the Kubernetes side (`lamp-tailscale-operator`, `lamp-tailscale-nodes`) consumes to authenticate to the tailnet.
- The tailnet's `tailscale-client-id`/`tailscale-client-secret` Oracle Vault entries are currently populated by hand; wiring this module's outputs into `oracle/kms_vault_secrets` is a follow-up step, not done yet.
