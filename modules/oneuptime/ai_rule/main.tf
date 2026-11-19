resource "oneuptime_ai_rule" "this" {
  name                = var.name
  description         = var.description
  trigger_entity_type = var.trigger_entity_type
  is_enabled          = var.is_enabled

  execution_mode = var.execution_mode
  investigates   = var.investigates
  fixes          = var.fixes

  open_code_fix_pull_requests  = var.open_code_fix_pull_requests
  open_telemetry_pull_requests = var.open_telemetry_pull_requests

  external_mcp_servers = var.external_mcp_server_ids
  code_repositories    = var.code_repository_ids

  title_pattern = var.title_pattern

  ai_context      = var.ai_context
  llm_provider_id = var.llm_provider_id

  incident_severities = var.trigger_entity_type == "Incident" ? var.severity_ids : null
  alert_severities    = var.trigger_entity_type == "Alert" ? var.severity_ids : null
}
