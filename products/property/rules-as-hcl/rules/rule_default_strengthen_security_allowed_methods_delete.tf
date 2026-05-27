
data "akamai_property_rules_builder" "rule_delete" {
  rules_v2026_02_16 {
    name                  = "DELETE"
    comments              = "Allow use of the DELETE HTTP request method."
    criteria_must_satisfy = "all"
    behavior {
      allow_delete {
        enabled = false
      }
    }
  }
}
