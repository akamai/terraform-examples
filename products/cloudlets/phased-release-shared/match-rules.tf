# "green" is the default origin. "blue" is the phased origin, so we're defining the amount
# of traffic that migrates to "blue". This is why there's no mention of "green" here.
data "akamai_cloudlets_phased_release_match_rule" "match_rules_cd" {
  match_rules {
    name  = "Force Blue"
    start = 0
    end   = 0
    matches {
      match_type     = "header"
      match_value    = ""
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
      object_match_value {
        name                = "Test"
        type                = "object"
        name_case_sensitive = false
        name_has_wildcard   = false
        options {
          value                = ["blue"]
          value_has_wildcard   = false
          value_case_sensitive = false
          value_escaped        = false
        }
      }
    }
    match_url = ""
    forward_settings {
      origin_id = "pr_blue"
      percent   = 100
    }
    disabled       = false
    matches_always = false
  }

  match_rules {
    name  = "Percent to blue"
    start = 0
    end   = 0
    matches {
      match_type     = "header"
      match_value    = ""
      match_operator = "exists"
      case_sensitive = false
      negate         = true
      check_ips      = ""
      object_match_value {
        name                = "Test"
        type                = "object"
        name_case_sensitive = false
        name_has_wildcard   = false
        options {
          value                = []
          value_has_wildcard   = false
          value_case_sensitive = false
          value_escaped        = false
        }
      }
    }
    match_url = ""
    forward_settings {
      origin_id = "pr_blue"
      percent   = 50
    }
    disabled       = false
    matches_always = false
  }
}
