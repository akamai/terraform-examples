module "golive" {
  source        = "../modules/golive"
  hostnames     = var.hostnames
  property_name = var.property_name
  edge_hostname = var.edge_hostname
  zone          = var.zone
}
