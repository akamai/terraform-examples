
data "akamai_property_rules_builder" "rule_post" {
  rules_v2025_01_13 {
    name                  = "POST"
    comments              = "Allow use of the POST HTTP request method."
    criteria_must_satisfy = "all"
    behavior {
      allow_post {
        allow_without_content_length = false
        enabled                      = true
      }
    }
  }
}
