locals {
  property_name = "saas-test4.example.org"
  edge_hostname = "saas-test4.example.org"
  zone          = "example.org"
  hostnames     = ["saas-test4-1.example.org", "saas-test4-2.example.org"]
}

module "golive" {
  source        = "../modules/golive"
  hostnames     = local.hostnames
  property_name = local.property_name
  edge_hostname = local.edge_hostname
  zone          = local.zone
}
