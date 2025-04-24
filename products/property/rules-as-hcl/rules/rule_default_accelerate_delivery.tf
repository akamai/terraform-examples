
data "akamai_property_rules_builder" "rule_accelerate_delivery" {
  rules_v2025_01_13 {
    name                  = "Accelerate delivery"
    comments              = "Control the settings related to improving the performance of delivering objects to your users."
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.rule_origin_connectivity.json,
      data.akamai_property_rules_builder.rule_protocol_optimizations.json,
      data.akamai_property_rules_builder.rule_prefetching.json,
      data.akamai_property_rules_builder.rule_adaptive_acceleration.json,
    ]
  }
}
