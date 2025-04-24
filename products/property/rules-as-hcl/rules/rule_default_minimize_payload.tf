
data "akamai_property_rules_builder" "rule_minimize_payload" {
  rules_v2025_01_13 {
    name                  = "Minimize payload"
    comments              = "Control the settings that reduce the size of the delivered content and decrease the number of bytes sent by your properties. This allows you to cut down the network overhead of your website or API."
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.rule_compressible_objects.json,
    ]
  }
}
