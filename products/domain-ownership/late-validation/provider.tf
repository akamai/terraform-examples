terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 10.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.13"
    }
  }
  required_version = ">= 1.9.0"
}