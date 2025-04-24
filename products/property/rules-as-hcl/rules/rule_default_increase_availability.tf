
data "akamai_property_rules_builder" "rule_increase_availability" {
  rules_v2025_01_13 {
    name                  = "Increase availability"
    comments              = "Control how to respond when your origin or third parties are slow or even down to minimize the negative impact on user experience."
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.rule_simulate_failover.json,
      data.akamai_property_rules_builder.rule_site_failover.json,
      data.akamai_property_rules_builder.rule_origin_health.json,
      data.akamai_property_rules_builder.rule_script_management.json,
    ]
  }
}
