locals {
  property_name = "bucket-test10.example.org"
  edge_hostname = "bucket-test10.example.org.edgesuite.net"
  zone          = "example.org"
  hostnames     = ["bucket-test4.example.org", "bucket-test5.example.org"]
}

module "golive" {
  source        = "../modules/golive"
  hostnames     = local.hostnames
  property_name = local.property_name
  edge_hostname = local.edge_hostname
  zone          = local.zone
}
