data "akamai_property_rules_builder" "rule_alb_behavior" {
  rules_v2026_02_16 {
    name                  = "ALB"
    criteria_must_satisfy = "all"
    behavior {
      application_load_balancer {
        all_down_net_storage {
          cp_code              = 405092
          download_domain_name = "gsstrip.download.akamai.com"
          g2o_token            = "405092=6G96eY0RZK5O3Eb2xYVFzfzt8Pn8fZ37Cnv93266KVNB1U6VF1"
        }
        all_down_net_storage_file = "/jaescalo/failaction/maintenance.html"
        all_down_status_code      = "222"
        all_down_title            = ""
        allow_cache_prefresh      = true
        cached_content_title      = ""
        cloudlet_policy {
          id   = var.alb_cloudlet_policy_id
          name = var.alb_cloudlet_policy_name
        }
        enabled                              = true
        failover_attempts_threshold          = 5
        failover_mode                        = "AUTOMATIC"
        failover_status_codes                = ["500", "501", "502", "503", "504", "505", "506", "507", "508", "509", ]
        failover_title                       = ""
        label                                = "alb_ew_tests"
        specify_stickiness_cookie_domain     = false
        stickiness_cookie_automatic_salt     = true
        stickiness_cookie_set_http_only_flag = true
        stickiness_cookie_type               = "ON_BROWSER_CLOSE"
        stickiness_title                     = ""
      }
    }
  }
}

data "akamai_property_rules_builder" "rule_conditional_origin_group" {
  rules_v2026_02_16 {
    name                  = "Conditional Origin Group"
    criteria_must_satisfy = "all"
    behavior {
      allow_cloudlets_origins {
        enabled                      = true
        honor_base_directory         = true
        purge_origin_query_parameter = "originId"
      }
    }
    children = [
      data.akamai_property_rules_builder.rule_conditional_origin_a_definition.json,
      data.akamai_property_rules_builder.rule_conditional_origin_b_definition.json,
    ]
  }
}

data "akamai_property_rules_builder" "rule_conditional_origin_a_definition" {
  rules_v2026_02_16 {
    name                  = "Conditional Origin A Definition"
    criteria_must_satisfy = "all"
    criterion {
      cloudlets_origin {
        origin_id = var.alb_lb_data_centers["origin-a"].origin_id
      }
    }
    behavior {
      origin {
        cache_key_hostname            = "ORIGIN_HOSTNAME"
        compress                      = true
        enable_true_client_ip         = true
        forward_host_header           = "ORIGIN_HOSTNAME"
        hostname                      = "origin-a.aka-dev.net"
        http_port                     = 80
        https_port                    = 443
        ip_version                    = "IPV4"
        min_tls_version               = "DYNAMIC"
        origin_certificate            = ""
        origin_sni                    = true
        origin_type                   = "CUSTOMER"
        ports                         = ""
        tls_version_title             = ""
        true_client_ip_client_setting = false
        true_client_ip_header         = "True-Client-IP"
        verification_mode             = "PLATFORM_SETTINGS"
      }
    }
  }
}

data "akamai_property_rules_builder" "rule_conditional_origin_b_definition" {
  rules_v2026_02_16 {
    name                  = "Conditional Origin B Definition"
    criteria_must_satisfy = "all"
    criterion {
      cloudlets_origin {
        origin_id = var.alb_lb_data_centers["origin-b"].origin_id
      }
    }
    behavior {
      origin {
        cache_key_hostname            = "ORIGIN_HOSTNAME"
        compress                      = true
        enable_true_client_ip         = true
        forward_host_header           = "ORIGIN_HOSTNAME"
        hostname                      = "origin-b.aka-dev.net"
        http_port                     = 80
        https_port                    = 443
        ip_version                    = "IPV4"
        min_tls_version               = "DYNAMIC"
        origin_certificate            = ""
        origin_sni                    = true
        origin_type                   = "CUSTOMER"
        ports                         = ""
        tls_version_title             = ""
        true_client_ip_client_setting = false
        true_client_ip_header         = "True-Client-IP"
        verification_mode             = "PLATFORM_SETTINGS"
      }
    }
  }
}