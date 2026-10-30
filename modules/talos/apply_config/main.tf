resource "terraform_data" "apply_config" {
  # A plain change to `input` only recomputes `output` in place and does not
  # replace the resource, so the create-time provisioner below would never
  # re-run on a second config change without this.
  triggers_replace = {
    node                  = var.node
    machine_configuration = var.machine_configuration
    mode                  = var.mode
  }

  input = {
    node                  = var.node
    machine_configuration = var.machine_configuration
    mode                  = var.mode
  }

  provisioner "local-exec" {
    environment = {
      TALOS_CA       = var.client_configuration.ca_certificate
      TALOS_CRT      = var.client_configuration.client_certificate
      TALOS_KEY      = var.client_configuration.client_key
      MACHINE_CONFIG = var.machine_configuration
      MODE           = var.mode
    }
    command = <<-EOT
      set -euo pipefail
      cfg=$(mktemp)
      trap 'rm -f "$cfg"' EXIT
      # talos_machine_secrets.client_configuration is already base64-encoded
      # PEM (matching talosconfig's own on-disk format) — do not re-encode it.
      printf 'context: apply\ncontexts:\n  apply:\n    endpoints: ["%s"]\n    nodes: ["%s"]\n    ca: %s\n    crt: %s\n    key: %s\n' \
        "${var.node}" "${var.node}" "$TALOS_CA" "$TALOS_CRT" "$TALOS_KEY" >"$cfg"

      mc=$(mktemp)
      trap 'rm -f "$cfg" "$mc"' EXIT
      printf '%s' "$MACHINE_CONFIG" >"$mc"

      talosctl --talosconfig "$cfg" -n ${var.node} apply-config -f "$mc" --mode="$MODE"

      elapsed=0
      until talosctl --talosconfig "$cfg" -n ${var.node} service etcd 2>/dev/null | grep -q "HEALTH.*OK\|Health check successful"; do
        if [ $elapsed -ge 300 ]; then
          echo "etcd did not report healthy on ${var.node} within 300s after apply-config" >&2
          exit 1
        fi
        sleep 5
        elapsed=$((elapsed + 5))
      done
      echo "config applied to ${var.node} and etcd is healthy"
    EOT
  }
}
