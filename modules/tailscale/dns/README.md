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
| [tailscale_dns_configuration.template](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_magic_dns"></a> [magic\_dns](#input\_magic\_dns) | Enable MagicDNS for the tailnet | `bool` | `true` | no |
| <a name="input_override_local_dns"></a> [override\_local\_dns](#input\_override\_local\_dns) | Prefer global\_nameservers over each device's local DNS configuration for names outside the tailnet | `bool` | `false` | no |
| <a name="input_global_nameservers"></a> [global\_nameservers](#input\_global\_nameservers) | Global DNS nameservers devices on the tailnet use to resolve DNS names outside the tailnet | <pre>list(object({<br>    address            = string<br>    use_with_exit_node = optional(bool, false)<br>  }))</pre> | `[]` | no |
| <a name="input_split_dns"></a> [split\_dns](#input\_split\_dns) | Per-domain nameserver overrides (split DNS), equivalent to the Cloudflare tunnel module's private\_domains/local\_domain\_fallback | <pre>list(object({<br>    domain = string<br>    nameservers = list(object({<br>      address            = string<br>      use_with_exit_node = optional(bool, false)<br>    }))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Tailscale DNS configuration resource |

## Notes

- Uses the unified `tailscale_dns_configuration` resource rather than the separate `tailscale_dns_preferences`/`tailscale_dns_nameservers`/`tailscale_dns_split_nameservers` resources — the provider does not allow mixing them, and only the unified resource exposes `use_with_exit_node` (Tailscale >= 1.88.1), which is required for a nameserver to keep resolving while a client has an exit node selected. Without it, a client using an exit node ignores split DNS/global nameservers entirely and resolves through the exit node's own upstream DNS instead.
- `magic_dns`/`global_nameservers`/`split_dns` are tailnet-wide settings, so only one instance of this module should be applied per tailnet.
- `split_dns` is the direct equivalent of the Cloudflare tunnel module's `private_domains` (WARP local-domain-fallback): it resolves an internal DNS suffix through a given internal nameserver instead of the public internet.
- `global_nameservers` order matters: the `nameservers` block is a plain ordered list in state, and the Tailscale API does not necessarily store it in the order it was submitted. If `plan` shows a stable (not flapping) reorder-only diff after the first apply, reorder `global_nameservers` in the caller to match the order reported in the diff rather than reapplying repeatedly.
