
data "akamai_property_rules_builder" "rule_traffic_reporting" {
  rules_v2025_01_13 {
    name                  = "Traffic reporting"
    comments              = "Identify your main traffic segments so you can granularly zoom in your traffic statistics like hits, bandwidth, offload, response codes, and errors."
    criteria_must_satisfy = "all"
    behavior {
      cp_code {
        value {
          id = var.default_cpcode
        }
      }
    }
  }
}
