terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "3.2.0"
    }
  }
}

provider "rancher2" {
  api_url   = var.api_url
  bootstrap = true
}
