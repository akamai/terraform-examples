output "rules" {
  value = data.akamai_property_rules_builder.rule_default.json
}

output "rule_format" {
  value = data.akamai_property_rules_builder.rule_default.rule_format
}