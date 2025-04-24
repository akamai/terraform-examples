
data "akamai_property_rules_builder" "rule_adaptive_acceleration" {
  rules_v2025_01_13 {
    name                  = "Adaptive acceleration"
    comments              = "Automatically and continuously apply performance optimizations to your website using machine learning."
    criteria_must_satisfy = "all"
  }
}
