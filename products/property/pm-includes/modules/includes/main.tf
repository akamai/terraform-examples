/*
* This defines a PM Include that will be managed by each micro-services team. It
* will be used by each individual microservices development team in isolation from
* each other and in isolation from the centrally managed property. Each team will
* have their own state file for proper separation of concerns. This module requires
* rule json to be submitted. It's expected, but not mandated, that this will be
* provided by an akamai_property_rules_builder datasource that's managed by the
* application team. See the "team1" example folder for usage.
*
* This module outputs the include id. The user of this module should also pass this
* on as an output so it can be obtained from the terraform_remote_state datasource
*/
resource "akamai_property_include" "test_include" {
  contract_id = var.contract_id
  group_id    = var.group_id
  name        = var.include_name
  product_id  = var.product_id
  type        = "MICROSERVICES"
  rule_format = var.rule_format
  rules       = var.rules
  #rule_format = data.akamai_property_rules_builder.test_include_rule_default.rule_format
  #rules       = data.akamai_property_rules_builder.test_include_rule_default.json
}

resource "akamai_property_include_activation" "test_include_staging" {
  contract_id                    = akamai_property_include.test_include.contract_id
  group_id                       = akamai_property_include.test_include.group_id
  include_id                     = akamai_property_include.test_include.id
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = true
  version                        = akamai_property_include.test_include.latest_version
  notify_emails                  = var.contacts
}

#resource "akamai_property_include_activation" "test_include_production" {
#  contract_id = akamai_property_include.test_include.contract_id
#  group_id = akamai_property_include.test_include.group_id
#  include_id = akamai_property_include.test_include.id
#  network = "PRODUCTION"
#  auto_acknowledge_rule_warnings = true
#  version = akamai_property_include.test_include.latest_version
#  notify_emails = var.contacts
#}

output "id" {
  value = akamai_property_include.test_include.id
}
