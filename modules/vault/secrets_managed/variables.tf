variable "path" {
  type        = string
  default     = "secrets"
  description = "The mount path."
}

variable "data" {
  type        = any
  sensitive   = true
  description = "A map of key-value pairs representing the secret data. Usually flat (map(string)), but may nest one level deep (a key's value is itself a map) when merge = true and the document being merged into nests its values the same way - see the merge variable. Typed any rather than map(string) so this and the merge path's object-typed result share one expression without a static type conflict."
}

variable "secret_path" {
  type        = string
  description = "The secret path."
}

variable "merge" {
  type        = bool
  default     = false
  description = <<-EOT
    When true, read the secret currently at secret_path and merge var.data
    into it instead of replacing the whole document - keys not present in
    var.data are preserved (hand-written, or owned by a different caller),
    keys present in var.data always reflect var.data. The merge goes one
    level deep: if a key exists in both documents and both sides hold an
    object (not a plain string), those two objects are merged too, instead
    of var.data's object replacing the whole thing - this is what lets a
    caller add one new named token into an existing per-org map without
    dropping its siblings. Requires secret_path to already have at least
    one key written at it before the first apply that sets merge = true -
    the read has nothing to merge against otherwise. Still re-applies the
    merged document on every apply (same as the default), so a key this
    module owns stays current.
  EOT
}
