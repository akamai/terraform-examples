
data "akamai_property_rules_builder" "rule_log_delivery" {
  rules_v2025_01_13 {
    name                  = "Log delivery"
    comments              = "Specify the level of detail you want to be logged in your Log Delivery Service reports. Log User-Agent Header to obtain detailed information in the Traffic by Browser and OS report."
    criteria_must_satisfy = "all"
    behavior {
      report {
        log_accept_language  = false
        log_cookies          = "OFF"
        log_custom_log_field = false
        log_edge_ip          = false
        log_host             = true
        log_referer          = false
        log_user_agent       = false
        log_x_forwarded_for  = false
      }
    }
  }
}
