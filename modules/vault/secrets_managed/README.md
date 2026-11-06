Sibling of `vault/secrets` without `lifecycle { ignore_changes = [data_json] }`: `vault/secrets`
deliberately never overwrites a path's content after creation (built for secrets a human manages
by hand via `vault kv put`). This module is for the opposite case — a value Terraform itself
produces and must keep current on every apply, e.g. a rotated access token. Do not add
`ignore_changes` here; that would silently stop rotated values from ever reaching Vault.

`merge = true` is for a third case: this call owns one or a few keys at a path whose *other* keys
are hand-written (or owned by a different Terraform caller) and must survive. It reads the
existing document and folds `var.data` into it on every apply, instead of replacing the whole
document - the hand-written keys pass through unchanged, the keys this call owns stay current.
Only correct with a single Terraform writer per key at a given path; two callers both claiming the
same key at the same secret_path will fight each other's plan every run. Also requires
`secret_path` to already hold *some* data before the first `merge = true` apply - the read this
needs has nothing to merge against on a path that was never written.
