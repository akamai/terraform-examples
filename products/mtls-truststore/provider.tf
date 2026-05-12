terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 9.0.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0"
}