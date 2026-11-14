terraform {
  required_providers {
    litellm = {
      source  = "registry.terraform.io/ncecere/litellm"
      version = "2.2.3"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}
