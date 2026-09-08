variable "tag_owners" {
  description = "Map of ACL tag name to the list of users/groups allowed to assign it"
  type        = map(list(string))
  default     = {}
}

variable "auto_approvers_routes" {
  description = "Map of subnet route (CIDR) to the list of tags allowed to auto-advertise it without manual approval"
  type        = map(list(string))
  default     = {}
}

variable "auto_approvers_exit_node" {
  description = "List of tags allowed to auto-advertise as an exit node without manual approval"
  type        = list(string)
  default     = []
}

variable "grants" {
  description = "List of ACL grants (raw policy-file grant objects: src/dst/ip or src/dst/app)"
  type        = list(any)
  default     = []
}

variable "ssh" {
  description = "List of ACL SSH rules (raw policy-file ssh objects: action/src/dst/users)"
  type        = list(any)
  default     = []
}

variable "overwrite_existing_content" {
  description = "Overwrite any existing ACL policy file content in the tailnet on create"
  type        = bool
  default     = false
}

variable "reset_acl_on_destroy" {
  description = "Reset the ACL policy file to the Tailscale default when this resource is destroyed"
  type        = bool
  default     = false
}
