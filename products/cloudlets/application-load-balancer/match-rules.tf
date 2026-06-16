data "akamai_cloudlets_application_load_balancer_match_rule" "match_rules_alb" {
  match_rules {
    name  = "Rule #1"
    start = 0
    end   = 0
    matches {
      match_type     = "path"
      match_value    = "/origin-a/"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    match_url      = ""
    matches_always = false
    forward_settings {
      origin_id = "demo_LB_ID"
    }
    disabled = false
  }

  match_rules {
    name  = "Rule #2"
    start = 0
    end   = 0
    matches {
      match_type     = "path"
      match_value    = "/origin-b/"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    match_url      = ""
    matches_always = false
    forward_settings {
      origin_id = "demo_LB_ID_2"
    }
    disabled = false
  }
}
