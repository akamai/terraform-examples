
data "akamai_property_rules_builder" "rule_patch" {
  rules_v2026_02_16 {
    name                  = "PATCH"
    comments              = "Allow use of the PATCH HTTP request method."
    criteria_must_satisfy = "all"
    behavior {
      allow_patch {
        enabled = false
      }
    }
  }
}
