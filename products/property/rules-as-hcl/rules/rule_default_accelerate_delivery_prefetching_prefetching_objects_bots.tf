
data "akamai_property_rules_builder" "rule_bots" {
  rules_v2025_01_13 {
    name                  = "Bots"
    comments              = "Disable prefetching for specific clients identifying themselves as bots and crawlers. This avoids requesting unnecessary resources from the origin."
    criteria_must_satisfy = "all"
    criterion {
      user_agent {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        match_wildcard       = true
        values               = ["*bot*", "*crawl*", "*spider*", ]
      }
    }
    behavior {
      prefetch {
        enabled = false
      }
    }
  }
}
