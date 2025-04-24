
data "akamai_property_rules_builder" "rule_prefetching" {
  rules_v2025_01_13 {
    name                  = "Prefetching"
    comments              = "Instruct edge servers to retrieve embedded resources before the browser requests them."
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.rule_prefetching_objects.json,
      data.akamai_property_rules_builder.rule_prefetchable_objects.json,
    ]
  }
}
