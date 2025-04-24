
data "akamai_property_rules_builder" "rule_allowed_methods" {
  rules_v2025_01_13 {
    name                  = "Allowed methods"
    comments              = "Allow the use of HTTP methods. Consider enabling additional methods under a path match for increased origin security."
    criteria_must_satisfy = "all"
    behavior {
      all_http_in_cache_hierarchy {
        enabled = true
      }
    }
    children = [
      data.akamai_property_rules_builder.rule_post.json,
      data.akamai_property_rules_builder.rule_options.json,
      data.akamai_property_rules_builder.rule_put.json,
      data.akamai_property_rules_builder.rule_delete.json,
      data.akamai_property_rules_builder.rule_patch.json,
    ]
  }
}
