/*
* This is an example of how a microservices development team might manage
* their own PM Include. The Property Manager Rules and Behaviours are
* configured locally here and passed to the module. It's expected that you'll
* use an akamai_property_rules_builder datasource to manage these rules but
* you could use raw json, JSonnet or even YAML to manage these, provided 
* they are converted back to valid json before passing to the module
*
* This configuration instance will maintain its own state file so it can
* work completely in isolation from other development teams or the central
* devops team. However, the central team's Terraform instance will read the
* include id from this state file when they apply their changes.
*/

locals {
  include_name = "new-include"
  contacts      = ["user@example.org"]
  contract_id   = "ctr_1-1NC95D"
  group_id      = "grp_91533"
  product_id = "prd_Fresca"
}

module "include" {
  source      = "../modules/includes"
  contract_id = local.contract_id
  group_id    = local.group_id
  contacts    = local.contacts
  include_name   = local.include_name
  rule_format = data.akamai_property_rules_builder.test_include_rule_default.rule_format
  rules       = data.akamai_property_rules_builder.test_include_rule_default.json
}

# It's important to output the include id
output "id" {
  value = module.include.id
}
