terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 7.0"
    }
  }
  required_version = ">= 1.9.0"
}

# Uncomment as required
#provider "akamai" {
#  edgerc         = var.edgerc_path
#  config_section = var.config_section
#}
#
#provider "akamai" {
#  config {
#    client_secret = var.akamai_client_secret
#    host          = var.akamai_host
#    access_token  = var.akamai_access_token
#    client_token  = var.akamai_client_token
#    account_key   = var.akamai_account_key
#  }
#}
