locals {
  property_name = "saas-test4.example.org"
  edge_hostname = "saas-test4.example.org"
  zone          = "example.org"
  hostnames     = ["saas-test4-1.example.org", "saas-test4-2.example.org"]
  contacts      = ["example@example.org"]
  contract_id   = "ctr_1-1NC95D"
  group_id      = "grp_91533"
}

module "delivery" {
  source        = "../modules/property"
  contract_id   = local.contract_id
  group_id      = local.group_id
  property_name = local.property_name
  edge_hostname = local.edge_hostname
  hostnames     = local.hostnames
  contacts      = local.contacts

  # Akamai internal compliance process
  compliance_record = var.compliance_record
}

module "dns" {
  source     = "../modules/dns"
  zone       = local.zone
  hostnames  = module.delivery.hostnames
  challenges = module.delivery.challenges
}

