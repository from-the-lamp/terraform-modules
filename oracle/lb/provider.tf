terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.12.0"
    }
  }
}

provider "vault" {
  address = var.host
  token   = var.token
}

provider "oci" {
  config_file_profile = var.config_file_profile
}
