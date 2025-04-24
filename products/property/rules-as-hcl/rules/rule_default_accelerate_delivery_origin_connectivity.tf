
data "akamai_property_rules_builder" "rule_origin_connectivity" {
  rules_v2025_01_13 {
    name                  = "Origin connectivity"
    comments              = "Optimize the connection between edge and origin."
    criteria_must_satisfy = "all"
    behavior {
      dns_async_refresh {
        enabled = true
        timeout = "1h"
      }
    }
    behavior {
      timeout {
        value = "5s"
      }
    }
    behavior {
      read_timeout {
        first_byte_timeout = "120s"
        value              = "120s"
      }
    }
  }
}
