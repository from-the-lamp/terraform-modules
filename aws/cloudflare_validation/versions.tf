terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "4.35.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}
