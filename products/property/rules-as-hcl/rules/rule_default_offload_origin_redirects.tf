
data "akamai_property_rules_builder" "rule_redirects" {
  rules_v2025_01_13 {
    name                  = "Redirects"
    comments              = "Configure caching for HTTP redirects. The redirect is cached for the same TTL as a 200 HTTP response when this feature is enabled."
    criteria_must_satisfy = "all"
    behavior {
      cache_redirect {
        enabled = "false"
      }
    }
    behavior {
      chase_redirects {
        enabled = false
      }
    }
  }
}
