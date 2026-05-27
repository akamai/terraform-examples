terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 10.0"
    }
    jsonnet = {
      source = "alxrem/jsonnet"
    }
  }
  required_version = ">= 1.9.0"
}
