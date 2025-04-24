
data "akamai_property_rules_builder" "rule_strengthen_security" {
  rules_v2025_01_13 {
    name                  = "Strengthen security"
    comments              = "Control the settings that minimize the information your website shares with clients and malicious entities to reduce your exposure to threats."
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.rule_allowed_methods.json,
      data.akamai_property_rules_builder.rule_obfuscate_debug_info.json,
      data.akamai_property_rules_builder.rule_obfuscate_backend_info.json,
      data.akamai_property_rules_builder.rule_hsts.json,
    ]
  }
}
