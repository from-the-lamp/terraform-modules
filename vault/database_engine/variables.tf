variable "path" {
  type        = string
  default     = "postgres"
  description = "The path within the database, typically used for namespace or schema."
}

variable "name" {
  type        = string
  default     = "postgres"
  description = "The name of the database."
}

variable "allowed_roles" {
  type        = list(string)
  default     = ["value"]
  description = "A list of roles that are allowed to access the database."
}

variable "connection_url" {
  type        = string
  description = "The URL for connecting to the database."
}

variable "root_username" {
  type        = string
  default     = ""
  description = "The root username for the database."
}

variable "root_password" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The root password for the database."
}
