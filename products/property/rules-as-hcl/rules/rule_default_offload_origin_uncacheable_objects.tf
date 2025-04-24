
data "akamai_property_rules_builder" "rule_uncacheable_objects" {
  rules_v2025_01_13 {
    name                  = "Uncacheable objects"
    comments              = "Configure the default client caching behavior for uncacheable content at the edge."
    criteria_must_satisfy = "all"
    criterion {
      cacheability {
        match_operator = "IS_NOT"
        value          = "CACHEABLE"
      }
    }
    behavior {
      downstream_cache {
        behavior = "BUST"
      }
    }
  }
}
