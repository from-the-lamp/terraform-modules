data "oci_core_images" "template" {
  compartment_id           = var.compartment_ocid
  operating_system         = var.operating_system
  operating_system_version = var.operating_system_version
  shape                    = var.compute_shape
}

data "oci_identity_availability_domain" "template" {
  compartment_id = var.compartment_ocid
  ad_number      = var.ad_number
}

resource "oci_core_instance_configuration" "template" {
  compartment_id = var.compartment_ocid
  freeform_tags  = var.freeform_tags
  display_name   = var.display_name
  instance_details {
    instance_type = "compute"
    launch_details {
      display_name        = var.display_name
      availability_domain = data.oci_identity_availability_domain.template.name
      compartment_id      = var.compartment_ocid
      metadata = {
        "ssh_authorized_keys" = var.admin_ssh_pub
        "user_data"           = var.user_data
      }
      agent_config {
        is_management_disabled = "false"
        is_monitoring_disabled = "false"
        plugins_config {
          desired_state = "DISABLED"
          name          = "Vulnerability Scanning"
        }
        plugins_config {
          desired_state = "ENABLED"
          name          = "Compute Instance Monitoring"
        }
        plugins_config {
          desired_state = "DISABLED"
          name          = "Bastion"
        }
      }
      create_vnic_details {
        assign_public_ip = var.assign_public_ip
        subnet_id        = var.subnet_id
        nsg_ids          = var.nsg_ids
      }
      shape = var.compute_shape
      shape_config {
        memory_in_gbs = "6"
        ocpus         = "1"
      }
      source_details {
        image_id    = data.oci_core_images.template.images.0.id
        source_type = "image"
      }
    }
  }
}
