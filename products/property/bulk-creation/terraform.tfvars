# Common Variables

group_name                      = "Demos - Templates"
email                           = "noreply@akamai.com"
domain                          = ".tf-demo.com"
certificate                     = 222841
product_id                      = "Fresca"
version_notes                   = "Initial version"
activate_property_on_staging    = true
activate_property_on_production = true


# Property specific variables

properties = {
  "dev" = {
    cpcode_name     = "Ion Terraform Demo"
    origin_hostname = "dev-origin.tf-demo.com"
    hostnames       = ["dev.tf-demo.com"]
    edge_hostname   = "tf-demo.com.edgekey.net"
  },
  "qa" = {
    cpcode_name     = "Ion Terraform Demo"
    origin_hostname = "qa-origin.tf-demo.com"
    hostnames       = ["qa.tf-demo.com"]
    edge_hostname   = "tf-demo.com.edgekey.net"
  },
  "test" = {
    cpcode_name     = "Ion Terraform Demo"
    origin_hostname = "test-origin.tf-demo.com"
    hostnames       = ["test.tf-demo.com"]
    edge_hostname   = "tf-demo.com.edgekey.net"
  }
}


