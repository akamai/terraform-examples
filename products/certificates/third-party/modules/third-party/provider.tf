terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 7.0"
    }
    acme = {
      source  = "vancluever/acme"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.9.0"
}

