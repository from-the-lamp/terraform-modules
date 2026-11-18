data "oneuptime_monitor_status" "offline" {
  name = "Offline"
}

data "oneuptime_monitor_status" "operational" {
  name = "Operational"
}

data "oneuptime_incident_severity" "critical" {
  name = var.incident_severity_name
}

# A fresh OneUptime project ships with "High"/"Low" alert severities only - no
# "Warning" exists to look up, so it's Terraform-managed here rather than
# created once by hand in the UI, matching the incident_severity convention
# above.
resource "oneuptime_alert_severity" "warning" {
  name        = var.alert_severity_name
  color       = var.alert_severity_color
  description = "Prometheus Alertmanager alerts at warning severity - visible, not paged."
}

locals {
  # Incoming Request monitor criteria evaluate top to bottom, first match
  # wins for the WHOLE request - so a webhook body is judged once, not once
  # per alert inside it. Alertmanager's own group_by now includes `severity`
  # (lamp-victoria-metrics' vmalertmanager-config.yaml), which guarantees
  # every webhook batch holds alerts of a single severity value, so
  # `commonLabels.severity` alone is trustworthy here without inspecting
  # every alert in the body.
  #
  # Each severity gets its own Firing/Resolved pair rather than one shared
  # pair, because the previous single-pair design had a real bug: only the
  # "Firing" criteria carried `incident_grouping`, so a webhook containing
  # ONLY resolved alerts (a fully-recovered group, nothing else firing)
  # matched "Resolved" instead, which had no grouping/resolution logic at
  # all - the corresponding incident never auto-closed. Fixed here by giving
  # every Firing/Resolved pair identical `incident_grouping` JSON, so
  # whichever one wins still resolves the right fingerprint.
  #
  # Matching also moved from a plain substring check (`Contains
  # "status":"firing"`, which also matches when that text merely appears
  # inside an unrelated field) to a JavaScript Expression that actually
  # parses the body and checks the real `alerts[]`/`commonLabels` structure.
  incident_grouping_json = jsonencode({
    groupByJSONPath      = "requestBody.alerts[*].fingerprint"
    resolvedWhenJSONPath = "requestBody.alerts[*].status"
    resolvedWhenValue    = "resolved"
  })

  # Templates have no conditionals and leave a missing path as written, so
  # only fields every alert carries are used: alertname, severity and
  # cluster are always there (cluster is vmagent's external label), summary
  # and description on every rule that defines them. instance and namespace
  # are not (cluster-wide alerts have neither), so they stay out of the
  # title. The oneuptime Alertmanager route sends one alert per webhook
  # (group_by ['...']), which is what makes commonAnnotations and alerts[0]
  # mean "this alert" rather than "whatever the batch happens to share".
  incident_title = "{{requestBody.commonLabels.alertname}} ({{requestBody.commonLabels.cluster}})"

  # FTL-223 (OneUptime Slack notification redesign): two things this
  # project does NOT control, confirmed by reading OneUptime's own source
  # rather than assumed -
  #   - SeriesContextEnricher.enrichTitle (packages/Common/Server/Utils/
  #     Monitor/SeriesContextEnricher.ts) unconditionally appends
  #     "- Fingerprint: <value>" to the title whenever that value isn't
  #     already literally present in the rendered text - no setting turns
  #     this off, so fingerprint cannot be kept out of the title.
  #   - the Incident/Alert card's own Severity/State/Root-Cause block is
  #     rendered by OneUptime itself, outside this description - not
  #     something a monitor template can suppress or rewrite.
  # Given that, `Severity:` is deliberately NOT repeated here (would be the
  # literal duplicate the redesign was asked to remove); a colored
  # emoji carries it instead, hardcoded per criteria since each severity
  # already has its own criteria block below - no {{severity}} needed.
  grafana_host = "https://grafana.from-the-lamp.work"

  # Loki's datasource uid is "loki" (lamp-grafana, confirmed live). This
  # link is wired even though a live Loki query returned HTTP 502 twice in
  # the same session (Grafana query path currently broken, tracked
  # separately) - per explicit instruction, ship the link now so it starts
  # working the moment Loki is fixed, rather than waiting on it.
  # Namespace is interpolated raw with no escaping: Kubernetes namespace
  # names are DNS-1123 labels (lowercase alphanumeric and hyphens only), so
  # they're always safe inside a URL - everything else here is percent-
  # encoded by hand, since OneUptime's template language has no
  # encode/escape function (confirmed: monitor/javascript-expression.md).
  # Cluster-wide alerts with no `namespace` label will show the raw
  # `{{requestBody.commonLabels.namespace}}` placeholder in this one link
  # until FTL-xxx (Grafana/Loki link building moves to the alert-rule
  # annotation level, where a real template language with conditionals is
  # available) - accepted as a known, tracked limitation for now.
  loki_logs_url = "${local.grafana_host}/explore?orgId=1&left=%7B%22datasource%22%3A%22loki%22%2C%22queries%22%3A%5B%7B%22refId%22%3A%22A%22%2C%22expr%22%3A%22%7Bnamespace%3D%5C%22{{requestBody.commonLabels.namespace}}%5C%22%7D%22%7D%5D%2C%22range%22%3A%7B%22from%22%3A%22now-1h%22%2C%22to%22%3A%22now%22%7D%7D"

  # RU/EN labels, written by hand once here - not machine-translated per
  # alert, and not OneUptime's own locale system (confirmed in source,
  # packages/Common/Server/Utils/Notification/UserLanguage.ts: that
  # mechanism keys off ONE addressed user's own account language setting
  # and is used for personal on-call pages; it has no concept of a channel
  # post with no single addressee, so it never applies to these Incident/
  # Alert cards - they always render OneUptime's own native chrome in
  # English regardless of anyone's profile language). Technical values
  # (alertname, cluster, namespace, the fingerprint OneUptime appends to
  # the title) stay untranslated raw/English on purpose - only the field
  # labels we write ourselves are bilingual. The alert-specific prose
  # itself (commonAnnotations.summary/description) is whatever English text
  # that alert rule's own annotations contain - translating that honestly
  # needs a real Russian annotation written per rule, which is real
  # additional work, not a reason to machine-translate it here (tracked
  # separately, not done in this pass).
  investigate_links = "📊 [Metrics / Метрики]({{requestBody.alerts[0].generatorURL}})   ·   📜 [Logs / Логи](${local.loki_logs_url})"

  description_for = {
    # 🔴/🟡/⚠️ stand in for severity so the word itself isn't repeated -
    # OneUptime's own card already shows it. Each severity's wording is
    # static per criteria, not templated from {{severity}}.
    critical = <<-EOT
      🔴  **{{requestBody.commonAnnotations.summary}}**

      {{requestBody.commonAnnotations.description}}

      **Cluster / Кластер:** `{{requestBody.commonLabels.cluster}}`

      ${local.investigate_links}
    EOT

    warning = <<-EOT
      🟡  **{{requestBody.commonAnnotations.summary}}**

      {{requestBody.commonAnnotations.description}}

      **Cluster / Кластер:** `{{requestBody.commonLabels.cluster}}`

      ${local.investigate_links}
    EOT
  }

  # The one place {{severity}} is still shown: the fallback criteria exists
  # BECAUSE the severity label was missing or unrecognized, so showing its
  # raw value here is the actual diagnostic content, not a duplicate.
  fallback_description = <<-EOT
    ⚠️  **{{requestBody.commonAnnotations.summary}}**

    {{requestBody.commonAnnotations.description}}

    **Cluster / Кластер:** `{{requestBody.commonLabels.cluster}}`
    **Severity (unrecognized) / Severity (не распознан):** `{{requestBody.commonLabels.severity}}`

    ${local.investigate_links}
  EOT

  # OneUptime does not expose `requestBody` as a variable: it replaces every
  # {{placeholder}} with the value as TEXT and then runs the result
  # (docs: monitor/javascript-expression.md). The first version of these
  # referenced a bare `requestBody`, threw a ReferenceError on every request
  # and so never matched - confirmed live 2026-11-18, no incident was
  # created after the apply. Strings are quoted, arrays are left bare and
  # indexed. A missing path is left as written: for the quoted severity that
  # is just a non-matching string, which is what sends an unlabeled batch to
  # the fallback criteria.
  js_firing = {
    for s in ["critical", "warning"] : s =>
    "\"{{requestBody.commonLabels.severity}}\" === \"${s}\" && {{requestBody.alerts}}.some(function(a){return a.status === \"firing\";})"
  }

  js_resolved = {
    for s in ["critical", "warning"] : s =>
    "\"{{requestBody.commonLabels.severity}}\" === \"${s}\" && {{requestBody.alerts}}.length > 0 && {{requestBody.alerts}}.every(function(a){return a.status === \"resolved\";})"
  }

  js_fallback = "{{requestBody.alerts}}.length > 0"
}

resource "oneuptime_monitor" "this" {
  name        = var.name
  description = var.description

  monitor_type = "Incoming Request"

  monitor_steps = [{
    criteria = [
      {
        name        = "Critical - Firing"
        description = "At least one critical-severity alert in this batch is firing"

        filter_condition      = "All"
        change_monitor_status = true
        monitor_status_id     = data.oneuptime_monitor_status.offline.id
        create_incidents      = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_firing["critical"]
          },
        ]

        incident_grouping = local.incident_grouping_json

        incidents = [{
          title                 = local.incident_title
          description           = local.description_for["critical"]
          incident_severity_id  = data.oneuptime_incident_severity.critical.id
          auto_resolve_incident = true
        }]
      },
      {
        name        = "Critical - Resolved"
        description = "Every alert in this critical-severity batch has resolved"

        filter_condition      = "All"
        change_monitor_status = true
        monitor_status_id     = data.oneuptime_monitor_status.operational.id
        create_incidents      = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_resolved["critical"]
          },
        ]

        incident_grouping = local.incident_grouping_json

        incidents = [{
          title                 = local.incident_title
          description           = local.description_for["critical"]
          incident_severity_id  = data.oneuptime_incident_severity.critical.id
          auto_resolve_incident = true
        }]
      },
      {
        name        = "Warning - Firing"
        description = "At least one warning-severity alert in this batch is firing"

        filter_condition      = "All"
        change_monitor_status = true
        monitor_status_id     = data.oneuptime_monitor_status.offline.id
        create_alerts         = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_firing["warning"]
          },
        ]

        incident_grouping = local.incident_grouping_json

        alerts = [{
          title              = local.incident_title
          description        = local.description_for["warning"]
          alert_severity_id  = oneuptime_alert_severity.warning.id
          auto_resolve_alert = true
        }]
      },
      {
        name        = "Warning - Resolved"
        description = "Every alert in this warning-severity batch has resolved"

        filter_condition      = "All"
        change_monitor_status = true
        monitor_status_id     = data.oneuptime_monitor_status.operational.id
        create_alerts         = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_resolved["warning"]
          },
        ]

        incident_grouping = local.incident_grouping_json

        alerts = [{
          title              = local.incident_title
          description        = local.description_for["warning"]
          alert_severity_id  = oneuptime_alert_severity.warning.id
          auto_resolve_alert = true
        }]
      },
      {
        # Catches anything that didn't match a known severity above (missing
        # or unexpected `severity` label) - TZ requirement: unknown alerts
        # must land somewhere controlled, never be silently dropped. Treated
        # as critical since "unknown severity" is itself worth a human look.
        name        = "Fallback - unknown severity"
        description = "Alertmanager batch with no recognized severity label"

        filter_condition = "All"
        create_incidents = true

        filters = [
          {
            check_on    = "JavaScript Expression"
            filter_type = "Evaluates To True"
            value       = local.js_fallback
          },
        ]

        incident_grouping = local.incident_grouping_json

        incidents = [{
          title                 = "Unrecognized-severity alert: ${local.incident_title}"
          description           = local.fallback_description
          incident_severity_id  = data.oneuptime_incident_severity.critical.id
          auto_resolve_incident = true
        }]
      },
    ]
  }]
}
