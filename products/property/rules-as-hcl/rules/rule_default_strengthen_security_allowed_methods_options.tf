
data "akamai_property_rules_builder" "rule_options" {
  rules_v2025_01_13 {
    name                  = "OPTIONS"
    comments              = "Allow use of the OPTIONS HTTP request method."
    criteria_must_satisfy = "all"
    behavior {
      allow_options {
        enabled = true
      }
    }
  }
}
