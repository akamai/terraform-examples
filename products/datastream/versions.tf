terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "= 6.2.0"
    }
    linode = {
      source  = "linode/linode"
      version = "= 2.23.0"
    }
  }
  required_version = "= 1.9.0"
  backend "s3" {}
}

# Akamai API credentials passed on as environment variables
provider "akamai" {
  config {
    client_secret = var.akamai_client_secret
    host          = var.akamai_host
    access_token  = var.akamai_access_token
    client_token  = var.akamai_client_token
    account_key   = var.akamai_account_key
  }
}