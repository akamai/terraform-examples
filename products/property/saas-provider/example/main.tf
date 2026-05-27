data "akamai_contract" "contract" {
  group_name = var.group_name
}

module "delivery" {
  source        = "../modules/property"
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_contract.contract.group_id
  property_name = var.property_name
  edge_hostname = var.edge_hostname
  hostnames     = var.hostnames
  contacts      = var.contacts

  # Akamai internal compliance process
  compliance_record = var.compliance_record
}

module "dns" {
  source     = "../modules/dns"
  zone       = var.zone
  hostnames  = module.delivery.hostnames
  challenges = module.delivery.challenges
}

