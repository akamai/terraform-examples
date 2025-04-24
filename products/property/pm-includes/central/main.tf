/*
* This is an example of how a central team would manage the main delivery
* property that manages your website. Associated PM Includes will be
* managed individually by each development team. The ids of each include
* are fetched by the terraform_remote_state datasource. You should configure
* each of these below and add them to the "includes" map that's passed to
* the module. This will cause a new rule to be added to the Property Manager
* config that contains each of the microservice mappings
*/

locals {
  property_name = "include.example.org"
  hostnames     = ["include.example.org"]
  contacts      = ["contact@example.org"]
  contract_id   = "ctr_1-1NC95D"
  group_id      = "grp_91533"
  includes = {
    "${data.terraform_remote_state.team1.outputs.id}" = ["/products"]
  }

}

module "delivery" {
  source        = "../modules/property"
  contract_id   = local.contract_id
  group_id      = local.group_id
  property_name = local.property_name
  hostnames     = local.hostnames
  contacts      = local.contacts
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
