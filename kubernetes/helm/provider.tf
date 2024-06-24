terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}

provider "helm" {
  registry {
    url      = var.oci_registry_url
    username = var.oci_registry_username
    password = var.oci_registry_password
  }
  kubernetes {
    host                   = var.host
    cluster_ca_certificate = var.cluster_ca_certificate
    client_certificate     = var.client_certificate
    client_key             = var.client_key
  }
}
