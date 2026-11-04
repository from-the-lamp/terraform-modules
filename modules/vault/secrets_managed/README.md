Sibling of `vault/secrets` without `lifecycle { ignore_changes = [data_json] }`: `vault/secrets`
deliberately never overwrites a path's content after creation (built for secrets a human manages
by hand via `vault kv put`). This module is for the opposite case — a value Terraform itself
produces and must keep current on every apply, e.g. a rotated access token. Do not add
`ignore_changes` here; that would silently stop rotated values from ever reaching Vault.
