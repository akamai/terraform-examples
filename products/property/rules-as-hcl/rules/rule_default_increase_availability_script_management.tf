
data "akamai_property_rules_builder" "rule_script_management" {
  rules_v2026_02_16 {
    name                  = "Script management"
    comments              = "Enable Script Management to minimize performance and availability impacts from third-party JavaScripts."
    criteria_must_satisfy = "all"
    behavior {
      script_management {
        enabled = false
      }
    }
  }
}
