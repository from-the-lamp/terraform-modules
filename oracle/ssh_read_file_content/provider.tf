terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.21.0"
    }
    ssh = {
      source = "loafoe/ssh"
      version = "2.6.0"
    }
  }
}

provider "oci" {
  config_file_profile = var.config_file_profile
}
