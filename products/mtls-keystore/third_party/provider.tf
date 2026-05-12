terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 8.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1"
    }
  }
  required_version = ">= 1.0"
}