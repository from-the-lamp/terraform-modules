variable "path" {
  type        = string
  default     = "secrets"
  description = "The mount path."
}

variable "data" {
  type        = map(string)
  sensitive   = true
  description = "A map of key-value pairs representing the secret data."
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
    keys present in var.data always reflect var.data. Requires secret_path
    to already have at least one key written at it before the first apply
    that sets merge = true - the read has nothing to merge against
    otherwise. Still re-applies the merged document on every apply (same
    as the default), so a key this module owns stays current.
  EOT
}
