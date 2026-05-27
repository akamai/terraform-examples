
data "akamai_property_rules_builder" "rule_hsts" {
  rules_v2026_02_16 {
    name                  = "HSTS"
    comments              = "Require all browsers to connect to your site using HTTPS."
    criteria_must_satisfy = "all"
    behavior {
      http_strict_transport_security {
        enable = false
      }
    }
  }
}
