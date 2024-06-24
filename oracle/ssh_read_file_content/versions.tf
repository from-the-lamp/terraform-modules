terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.46.0"
    }
    ssh = {
      source = "loafoe/ssh"
      version = "2.7.0"
    }
  }
}
