
data "akamai_property_rules_builder" "rule_origin_health" {
  rules_v2025_01_13 {
    name                  = "Origin health"
    comments              = "Monitor the health of your origin by tracking unsuccessful IP connection attempts."
    criteria_must_satisfy = "all"
    behavior {
      health_detection {
        maximum_reconnects = 3
        retry_count        = 3
        retry_interval     = "10s"
      }
    }
  }
}
