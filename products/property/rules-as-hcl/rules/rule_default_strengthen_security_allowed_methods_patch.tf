
data "akamai_property_rules_builder" "rule_patch" {
  rules_v2025_01_13 {
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
