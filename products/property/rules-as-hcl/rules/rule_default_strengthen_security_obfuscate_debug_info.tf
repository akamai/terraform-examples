
data "akamai_property_rules_builder" "rule_obfuscate_debug_info" {
  rules_v2025_01_13 {
    name                  = "Obfuscate debug info"
    comments              = "Do not expose back-end information unless the request contains the Pragma debug header."
    criteria_must_satisfy = "all"
    behavior {
      cache_tag_visible {
        behavior = "PRAGMA_HEADER"
      }
    }
  }
}
