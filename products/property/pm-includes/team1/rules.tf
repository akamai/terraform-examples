data "akamai_property_rules_builder" "test_include_rule_default" {
  rules_v2026_02_16 {
    name      = "default"
    is_secure = false
    behavior {
      origin {
        cache_key_hostname            = "ORIGIN_HOSTNAME"
        compress                      = true
        enable_true_client_ip         = true
        forward_host_header           = "REQUEST_HOST_HEADER"
        hostname                      = "origin-www.example.com"
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
    children = [
      data.akamai_property_rules_builder.include_rule_offload.json,
    ]
  }
}

data "akamai_property_rules_builder" "include_rule_offload" {
  rules_v2026_02_16 {
    name                  = "Offload"
    criteria_must_satisfy = "all"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["svg", ]
      }
    }
    behavior {
      caching {
        behavior        = "MAX_AGE"
        must_revalidate = false
        ttl             = "13s"
      }
    }
  }
}