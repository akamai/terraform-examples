
data "akamai_property_rules_builder" "rule_prefetching_objects" {
  rules_v2025_01_13 {
    name                  = "Prefetching objects"
    comments              = "Define for which HTML pages prefetching should be enabled."
    criteria_must_satisfy = "all"
    behavior {
      prefetch {
        enabled = true
      }
    }
    children = [
      data.akamai_property_rules_builder.rule_bots.json,
    ]
  }
}
