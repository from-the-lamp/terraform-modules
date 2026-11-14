Issues one litellm virtual key (FTL-174) and writes it into Vault, instead of a human running
`curl /key/generate` against the running proxy and pasting the result by hand.

The key value is generated once by `random_password` and persisted in Terraform state - re-applying
does not rotate it, same as any other Terraform-managed secret with no explicit rotation trigger.
`litellm_key` is created with that exact value (`ncecere/terraform-provider-litellm`'s predefined-key
support), so the same value exists both as the real litellm key and as what gets written to Vault.

The Vault write reuses `vault/secrets_managed`'s one-level merge logic inline (not a module call to
it, to avoid provider-alias plumbing for two providers through a nested module) - this call owns
only `var.vault_property` at `vault_mount/vault_secret_path`, every other key already at that path
(master_key, other consumers' own `*_api_key` properties) passes through unchanged. Requires that
path to already hold some data before the first apply, same precondition as `vault/secrets_managed`.

Caller must configure both the `litellm` provider (`api_base`, `api_key` - typically read from this
same Vault secret's own `master_key` property) and the `vault` provider.
