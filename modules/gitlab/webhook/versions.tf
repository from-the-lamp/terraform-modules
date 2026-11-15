terraform {
  required_version = ">= 1.5.0"
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 19.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.6.0"
    }
  }
}
