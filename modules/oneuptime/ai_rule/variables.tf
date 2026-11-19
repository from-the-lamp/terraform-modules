variable "name" {
  type        = string
  description = "Name of this AI rule, shown in OneUptime."
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "Friendly description of what this rule covers."
}

variable "trigger_entity_type" {
  type        = string
  description = "Signal type the rule decides about: Incident, Alert, Profile, Trace, Exception, Log, or Metric."

  validation {
    condition     = contains(["Incident", "Alert", "Profile", "Trace", "Exception", "Log", "Metric"], var.trigger_entity_type)
    error_message = "trigger_entity_type must be one of: Incident, Alert, Profile, Trace, Exception, Log, Metric."
  }
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "A disabled rule never matches anything."
}

variable "execution_mode" {
  type        = string
  default     = "Suggest"
  description = "Suggest waits for one-click human approval before each fix. FullAuto fixes without asking, where the resource/cluster's own AI agent settings additionally allow it."

  validation {
    condition     = contains(["Suggest", "FullAuto"], var.execution_mode)
    error_message = "execution_mode must be Suggest or FullAuto."
  }
}

variable "investigates" {
  type        = bool
  default     = true
  description = "Whether OneUptime AI investigates matched incidents/alerts."
}

variable "fixes" {
  type        = bool
  default     = true
  description = "Whether OneUptime AI fixes matched items, per execution_mode."
}

variable "open_code_fix_pull_requests" {
  type        = bool
  default     = true
  description = "Open a fix pull request for review when the cause is in code."
}

variable "open_telemetry_pull_requests" {
  type        = bool
  default     = true
  description = "Open a pull request adding missing logs, traces, or metrics."
}

variable "external_mcp_server_ids" {
  type        = set(string)
  default     = []
  description = "IDs of oneuptime_external_mcp_server this rule may use. Empty means every project MCP server, and all of their changes then wait for approval regardless of execution_mode."
}

variable "code_repository_ids" {
  type        = set(string)
  default     = []
  description = "IDs of oneuptime_code_repository the AI may read and open pull requests in. Empty means every connected repository."
}

variable "ai_context" {
  type        = string
  default     = null
  description = "Markdown notes read after the project's own AI context, at most 5000 characters - e.g. response-language and MR-workflow instructions specific to what this rule matches."
}

variable "llm_provider_id" {
  type        = string
  default     = null
  description = "ID of an oneuptime_llm_provider. Empty uses the project default, then the global one."
}

variable "severity_ids" {
  type        = set(string)
  default     = []
  description = "IDs of oneuptime_incident_severity (when trigger_entity_type = Incident) or oneuptime_alert_severity (when Alert). Empty matches any severity."
}

variable "title_pattern" {
  type        = string
  default     = null
  description = "Case-insensitive regex on the incident or alert title. Empty matches every title."
}
