
data "akamai_property_rules_builder" "rule_post_responses" {
  rules_v2026_02_16 {
    name                  = "POST responses"
    comments              = "Define when HTTP POST requests should be cached. You should enable it under a criteria match."
    criteria_must_satisfy = "all"
    behavior {
      cache_post {
        enabled = false
      }
    }
  }
}
