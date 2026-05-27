
data "akamai_property_rules_builder" "rule_site_failover" {
  rules_v2026_02_16 {
    name                  = "Site failover"
    comments              = "Specify how edge servers respond when the origin is not available."
    criteria_must_satisfy = "any"
    criterion {
      origin_timeout {
        match_operator = "ORIGIN_TIMED_OUT"
      }
    }
    behavior {
      fail_action {
        enabled = false
      }
    }
  }
}
