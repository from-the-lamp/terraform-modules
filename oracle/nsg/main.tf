resource "oci_core_network_security_group" "template" {
  compartment_id = var.compartment_ocid
  freeform_tags  = var.freeform_tags
  vcn_id         = var.vcn_id
  display_name   = var.display_name
}

resource "oci_core_network_security_group_security_rule" "template" {
  network_security_group_id = oci_core_network_security_group.template.id
  direction                 = var.rule_direction
  protocol                  = var.rule_protocol
  source                    = var.rule_source
  source_type               = var.rule_source_type

  dynamic "tcp_options" {
    for_each = var.tcp_rules
    content {
      dynamic "destination_port_range" {
        for_each = try(tcp_options.value.destination_port_range, null) != null ? [tcp_options.value.destination_port_range] : []
        content {
          max = destination_port_range.value.max
          min = destination_port_range.value.min
        }
      }
      dynamic "source_port_range" {
        for_each = try(tcp_options.value.source_port_range, null) != null ? [tcp_options.value.source_port_range] : []
        content {
          max = source_port_range.value.max
          min = source_port_range.value.min
        }
      }
    }
  }

  dynamic "udp_options" {
    for_each = var.udp_rules
    content {
      dynamic "destination_port_range" {
        for_each = try(udp_options.value.destination_port_range, null) != null ? [udp_options.value.destination_port_range] : []
        content {
          max = destination_port_range.value.max
          min = destination_port_range.value.min
        }
      }
      dynamic "source_port_range" {
        for_each = try(udp_options.value.source_port_range, null) != null ? [udp_options.value.source_port_range] : []
        content {
          max = source_port_range.value.max
          min = source_port_range.value.min
        }
      }
    }
  }
}