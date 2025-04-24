data "akamai_cloudlets_edge_redirector_match_rule" "match_rules_er_default" {
  match_rules {
    name  = "Redirect /1"
    start = 0
    end   = 0
    matches {
      match_type     = "protocol"
      match_value    = "https"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    matches {
      match_type     = "hostname"
      match_value    = "${var.environment}.tf-demo.com"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    matches {
      match_type     = "path"
      match_value    = "/redirector/1"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    use_relative_url          = "relative_url"
    status_code               = 302
    redirect_url              = "/"
    match_url                 = ""
    use_incoming_query_string = true
    disabled                  = false
  }

  match_rules {
    name  = "Redirect /2"
    start = 0
    end   = 0
    matches {
      match_type     = "protocol"
      match_value    = "https"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    matches {
      match_type     = "hostname"
      match_value    = "${var.environment}.tf-demo.com"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    matches {
      match_type     = "path"
      match_value    = "/redirector/2"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    use_relative_url          = "relative_url"
    status_code               = 302
    redirect_url              = "/"
    match_url                 = ""
    use_incoming_query_string = true
    disabled                  = false
  }

  match_rules {
    name  = "Redirect /3"
    start = 0
    end   = 0
    matches {
      match_type     = "protocol"
      match_value    = "https"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    matches {
      match_type     = "hostname"
      match_value    = "${var.environment}.tf-demo.com"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    matches {
      match_type     = "path"
      match_value    = "/redirector/3"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    use_relative_url          = "relative_url"
    status_code               = 302
    redirect_url              = "/"
    match_url                 = ""
    use_incoming_query_string = true
    disabled                  = false
  }
}
