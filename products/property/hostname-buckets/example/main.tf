locals {
  property_name = "bucket-test10.example.org"
  zone          = "example.org"
  contacts      = ["ian@example.org"]
  contract_id   = "ctr_1-1NC95D"
  group_id      = "grp_91533"
  hostnames     = ["bucket-test4.example.org", "bucket-test5.example.org"]
}

module "delivery" {
  source        = "../modules/property"
  contract_id   = local.contract_id
  group_id      = local.group_id
  property_name = local.property_name
  hostnames     = local.hostnames
  contacts      = local.contacts
}

module "dns" {
  source     = "../modules/dns"
  zone       = local.zone
  hostnames  = module.delivery.hostnames
  challenges = module.delivery.challenges
}

