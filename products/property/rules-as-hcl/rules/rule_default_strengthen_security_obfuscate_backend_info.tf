
data "akamai_property_rules_builder" "rule_obfuscate_backend_info" {
  rules_v2025_01_13 {
    name                  = "Obfuscate backend info"
    comments              = "Do not expose back-end information unless the request contains an additional secret header. Regularly change the criteria to use a specific unique value for the secret header."
    criteria_must_satisfy = "all"
    criterion {
      request_header {
        header_name                = "X-Akamai-Debug"
        match_case_sensitive_value = true
        match_operator             = "IS_NOT_ONE_OF"
        match_wildcard_name        = false
        match_wildcard_value       = false
        values                     = ["true", ]
      }
    }
    behavior {
      modify_outgoing_response_header {
        action                      = "DELETE"
        custom_header_name          = "X-Powered-By"
        standard_delete_header_name = "OTHER"
      }
    }
    behavior {
      modify_outgoing_response_header {
        action                      = "DELETE"
        custom_header_name          = "Server"
        standard_delete_header_name = "OTHER"
      }
    }
  }
}
