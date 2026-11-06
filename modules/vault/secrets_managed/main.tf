# Only read when merge is actually requested - for the non-merge (default)
# path this data source would be pure overhead, and would hard-fail plan
# for a brand-new secret_path that doesn't exist yet even though that case
# doesn't need merging at all.
data "vault_kv_secret_v2" "existing" {
  count = var.merge ? 1 : 0
  mount = var.path
  name  = var.secret_path
}

locals {
  # var.data always wins on key conflicts - this module owns exactly the
  # keys it's given, "existing" only supplies keys this call doesn't know
  # about (hand-written, or written by a different Terraform caller at the
  # same path). Re-read on every apply, so this stays idempotent as long as
  # no other writer touches the keys this module owns.
  merged_data = var.merge ? merge(
    jsondecode(data.vault_kv_secret_v2.existing[0].data_json),
    var.data,
  ) : var.data
}

resource "vault_kv_secret_v2" "template" {
  name      = var.secret_path
  mount     = var.path
  data_json = jsonencode(local.merged_data)
}
