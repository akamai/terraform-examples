/*
* This is an example of how a central team would manage the main delivery
* property that manages your website. Associated PM Includes will be
* managed individually by each development team. The ids of each include
* are fetched by the terraform_remote_state datasource. You should configure
* each of these below and add them to the "includes" map that's passed to
* the module. This will cause a new rule to be added to the Property Manager
* config that contains each of the microservice mappings
*/

data "akamai_contract" "contract" {
  group_name = var.group_name
}

locals {
  includes = {
    "${data.terraform_remote_state.team1.outputs.id}" = ["/products"]
  }
}

module "delivery" {
  source        = "../modules/property"
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_contract.contract.group_id
  property_name = var.property_name
  hostnames     = var.hostnames
  contacts      = var.contacts
  includes      = local.includes
}

# Use a remote state datasource for each team to get their include id
# You should define multiple datasources, one for each team
# The example below uses a "local" backend but you'd almost certainly
# use a remote backend instead
data "terraform_remote_state" "team1" {
  backend = "local"
  config = {
    path = "../team1/terraform.tfstate"
  }
}
