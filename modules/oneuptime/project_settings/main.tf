# The project already exists (created with the first admin account) - it is
# adopted here, not created. prevent_destroy because destroying this
# resource would delete the whole OneUptime project with every monitor and
# incident in it; removing the unit must go through `tofu state rm`.
import {
  to = oneuptime_project.this
  id = var.project_id
}

resource "oneuptime_project" "this" {
  name = var.name

  # New projects come with automatic AI investigation ON for incidents and
  # alerts, and with zero AI rules that means every single one (confirmed
  # live 2026-11-18: both were true and OneUptime AI had drafted a
  # postmortem for a test incident). Each run spends the LiteLLM key, so
  # they stay off until AI rules scope what is worth investigating.
  enable_automatic_incident_investigation = var.enable_automatic_incident_investigation
  enable_automatic_alert_investigation    = var.enable_automatic_alert_investigation
  enable_automatic_postmortem_draft       = var.enable_automatic_postmortem_draft

  lifecycle {
    prevent_destroy = true
  }
}
