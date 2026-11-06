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
  existing_data = var.merge ? jsondecode(data.vault_kv_secret_v2.existing[0].data_json) : {}

  # var.data always wins on scalar key conflicts - this module owns exactly
  # the keys it's given, "existing" only supplies keys this call doesn't
  # know about (hand-written, or written by a different Terraform caller at
  # the same path). On top of that, one level of object-in-object merging:
  # when both sides have an object at the same key (e.g. a per-org map of
  # named tokens, "from-the-lamp" -> {djinn, runner, ...}), the two objects
  # are merged instead of var.data's side replacing the whole thing - a
  # flat top-level merge() would silently drop every sibling key nested
  # under that one. Re-read on every apply, so this stays idempotent as
  # long as no other writer touches the keys this module owns. Only one
  # level deep - this isn't a general recursive merge, and var.data's
  # declared type (any, not map(string)) is what lets this and the
  # non-merge path below share one expression without a static type error.
  merged_data = var.merge ? {
    for k in setunion(keys(local.existing_data), keys(var.data)) :
    k => (
      contains(keys(local.existing_data), k) && contains(keys(var.data), k)
      && can(tomap(local.existing_data[k])) && can(tomap(var.data[k]))
      ) ? merge(local.existing_data[k], var.data[k]) : (
      contains(keys(var.data), k) ? var.data[k] : local.existing_data[k]
    )
  } : var.data
}

resource "vault_kv_secret_v2" "template" {
  name      = var.secret_path
  mount     = var.path
  data_json = jsonencode(local.merged_data)
}
