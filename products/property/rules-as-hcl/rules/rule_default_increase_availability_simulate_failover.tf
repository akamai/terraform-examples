
data "akamai_property_rules_builder" "rule_simulate_failover" {
  rules_v2025_01_13 {
    name                  = "Simulate failover"
    comments              = "Simulate an origin connection problem and test the site failover configuration on the CDN staging network."
    criteria_must_satisfy = "all"
    criterion {
      content_delivery_network {
        match_operator = "IS"
        network        = "STAGING"
      }
    }
    criterion {
      request_header {
        header_name                = "breakconnection"
        match_case_sensitive_value = true
        match_operator             = "IS_ONE_OF"
        match_wildcard_name        = false
        match_wildcard_value       = false
        values                     = ["Your-Secret-Here", ]
      }
    }
    behavior {
      break_connection {
        enabled = true
      }
    }
  }
}
