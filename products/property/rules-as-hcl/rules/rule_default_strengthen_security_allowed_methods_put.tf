
data "akamai_property_rules_builder" "rule_put" {
  rules_v2026_02_16 {
    name                  = "PUT"
    comments              = "Allow use of the PUT HTTP request method."
    criteria_must_satisfy = "all"
    behavior {
      allow_put {
        enabled = false
      }
    }
  }
}
