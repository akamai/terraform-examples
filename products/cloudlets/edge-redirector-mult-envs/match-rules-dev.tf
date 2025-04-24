data "akamai_cloudlets_edge_redirector_match_rule" "match_rules_er_dev" {

  match_rules {
    name  = "DEV Env specific redirect #1"
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
      match_value    = "/redirector/home/"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    use_relative_url          = "relative_url"
    status_code               = 302
    redirect_url              = "/home.html"
    match_url                 = ""
    use_incoming_query_string = true
    disabled                  = false
  }

  match_rules {
    name  = "DEV Env specific redirect #2"
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
      match_value    = "/redirector/info/"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    use_relative_url          = "copy_scheme_hostname"
    status_code               = 302
    redirect_url              = "/info"
    match_url                 = ""
    use_incoming_query_string = false
    disabled                  = false
  }

  match_rules {
    name  = "DEV Env specific redirect #3"
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
      match_value    = "/redirector/store/"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    use_relative_url          = "none"
    status_code               = 301
    redirect_url              = "https://${var.environment}.tf-demo.net"
    match_url                 = ""
    use_incoming_query_string = false
    disabled                  = false
  }

  match_rules {
    name  = "DEV Env specific redirect #4"
    start = 0
    end   = 0
    matches {
      match_type     = "path"
      match_value    = "/redirector/shop/*"
      match_operator = "contains"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    matches {
      match_type     = "regex"
      match_value    = "http://.*.tf-demo.net/redirector/shop/(.*)"
      match_operator = "equals"
      case_sensitive = false
      negate         = false
      check_ips      = ""
    }
    use_relative_url          = ""
    status_code               = 301
    redirect_url              = "https://tf-demo.net/\\1"
    match_url                 = ""
    use_incoming_query_string = false
    disabled                  = false
  }
}
