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
| [tailscale_acl.template](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tag_owners"></a> [tag\_owners](#input\_tag\_owners) | Map of ACL tag name to the list of users/groups allowed to assign it | `map(list(string))` | `{}` | no |
| <a name="input_auto_approvers_routes"></a> [auto\_approvers\_routes](#input\_auto\_approvers\_routes) | Map of subnet route (CIDR) to the list of tags allowed to auto-advertise it without manual approval | `map(list(string))` | `{}` | no |
| <a name="input_auto_approvers_exit_node"></a> [auto\_approvers\_exit\_node](#input\_auto\_approvers\_exit\_node) | List of tags allowed to auto-advertise as an exit node without manual approval | `list(string)` | `[]` | no |
| <a name="input_grants"></a> [grants](#input\_grants) | List of ACL grants (raw policy-file grant objects: src/dst/ip or src/dst/app) | `list(any)` | `[]` | no |
| <a name="input_ssh"></a> [ssh](#input\_ssh) | List of ACL SSH rules (raw policy-file ssh objects: action/src/dst/users) | `list(any)` | `[]` | no |
| <a name="input_overwrite_existing_content"></a> [overwrite\_existing\_content](#input\_overwrite\_existing\_content) | Overwrite any existing ACL policy file content in the tailnet on create | `bool` | `false` | no |
| <a name="input_reset_acl_on_destroy"></a> [reset\_acl\_on\_destroy](#input\_reset\_acl\_on\_destroy) | Reset the ACL policy file to the Tailscale default when this resource is destroyed | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Tailscale ACL resource |

## Notes

- This resource fully overwrites the tailnet's ACL policy file, so only one instance of this module should be applied per tailnet.
- `auto_approvers_routes`/`auto_approvers_exit_node` are the equivalent of the Cloudflare tunnel module's `tunnel_routes`/`split_tunnels`: they let tagged devices (subnet routers, exit nodes) advertise routes without a human approving them in the admin console.
