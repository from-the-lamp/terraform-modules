output "id" {
  value = oneuptime_monitor.this.id
}

output "heartbeat_url" {
  value     = "https://oneuptime.from-the-lamp.work/heartbeat/${oneuptime_monitor.this.incoming_request_secret_key}"
  sensitive = true
}

output "warning_alert_severity_id" {
  value = oneuptime_alert_severity.warning.id
}
