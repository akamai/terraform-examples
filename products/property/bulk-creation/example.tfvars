# Common Variables

group_name                      = "Example Group"
email                           = "user@example.com"
domain                          = ".example.com"
certificate                     = 123456
product_id                      = "Fresca"
version_notes                   = "Initial version"
activate_property_on_staging    = true
activate_property_on_production = true


# Property specific variables

properties = {
  "dev" = {
    cpcode_name     = "Example Terraform Demo"
    origin_hostname = "dev-origin.example.com"
    hostnames       = ["dev.example.com"]
    edge_hostname   = "example.com.edgekey.net"
  },
  "qa" = {
    cpcode_name     = "Example Terraform Demo"
    origin_hostname = "qa-origin.example.com"
    hostnames       = ["qa.example.com"]
    edge_hostname   = "example.com.edgekey.net"
  },
  "test" = {
    cpcode_name     = "Example Terraform Demo"
    origin_hostname = "test-origin.example.com"
    hostnames       = ["test.example.com"]
    edge_hostname   = "example.com.edgekey.net"
  }
}
