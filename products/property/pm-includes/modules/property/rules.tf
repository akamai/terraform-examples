
data "akamai_property_rules_builder" "property_rule_default" {
  rules_v2024_08_13 {
    name      = "default"
    is_secure = true
    uuid      = "default"
    behavior {
      origin {
        cache_key_hostname = "ORIGIN_HOSTNAME"
        compress           = false
        custom_certificate_authorities {}
        custom_certificates {}
        custom_valid_cn_values           = ["{{Origin Hostname}}", "{{Forward Host Header}}", "a248.e.akamai.net", "www.wheep.co.uk", ]
        enable_true_client_ip            = true
        forward_host_header              = "ORIGIN_HOSTNAME"
        hostname                         = "origin.example.org"
        http_port                        = 80
        https_port                       = 443
        ip_version                       = "IPV4"
        min_tls_version                  = "DYNAMIC"
        origin_certificate               = ""
        origin_certs_to_honor            = "COMBO"
        origin_sni                       = true
        origin_type                      = "CUSTOMER"
        ports                            = ""
        standard_certificate_authorities = ["akamai-permissive", ]
        tls_version_title                = ""
        true_client_ip_client_setting    = false
        true_client_ip_header            = "True-Client-IP"
        verification_mode                = "CUSTOM"
      }
    }
    behavior {
      auto_domain_validation {
        autodv = ""
      }
    }
    behavior {
      report {
        log_accept_language  = false
        log_cookies          = "OFF"
        log_custom_log_field = false
        log_edge_ip          = false
        log_host             = true
        log_referer          = false
        log_user_agent       = true
        log_x_forwarded_for  = false
      }
    }
    behavior {
      cp_code {
        value {
          id = akamai_cp_code.default.id
        }
      }
    }
    behavior {
      caching {
        behavior = "NO_STORE"
      }
    }
    behavior {
      allow_post {
        allow_without_content_length = false
        enabled                      = true
      }
    }
    behavior {
      allow_put {
        enabled = true
      }
    }
    behavior {
      m_pulse {
        api_key         = ""
        buffer_size     = ""
        config_override = ""
        enabled         = true
        loader_version  = "V12"
        require_pci     = false
        title_optional  = ""
      }
    }
    children = [
      data.akamai_property_rules_builder.property_rule_performance.json,
      data.akamai_property_rules_builder.property_rule_http_-_https.json,
      data.akamai_property_rules_builder.property_rule_caching.json,
      data.akamai_property_rules_builder.includes.json,
    ]
  }
}

data "akamai_property_rules_builder" "property_rule_performance" {
  rules_v2024_08_13 {
    name                  = "Performance"
    criteria_must_satisfy = "all"
    behavior {
      http2 {
        enabled = ""
      }
    }
    behavior {
      allow_transfer_encoding {
        enabled = true
      }
    }
  }
}

data "akamai_property_rules_builder" "property_rule_http_-_https" {
  rules_v2024_08_13 {
    name                  = "HTTP > HTTPS"
    criteria_must_satisfy = "all"
    criterion {
      request_protocol {
        value = "HTTP"
      }
    }
    behavior {
      redirect {
        destination_hostname  = "SAME_AS_REQUEST"
        destination_path      = "SAME_AS_REQUEST"
        destination_protocol  = "HTTPS"
        mobile_default_choice = "DEFAULT"
        query_string          = "APPEND"
        response_code         = 301
      }
    }
  }
}

data "akamai_property_rules_builder" "property_rule_caching" {
  rules_v2024_08_13 {
    name                  = "Caching"
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.property_rule_static_html.json,
      data.akamai_property_rules_builder.property_rule_css.json,
    ]
  }
}

data "akamai_property_rules_builder" "property_rule_static_html" {
  rules_v2024_08_13 {
    name                  = "Static html"
    criteria_must_satisfy = "all"
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "MATCHES_ONE_OF"
        normalize            = false
        values               = ["/css/*", ]
      }
    }
    behavior {
      caching {
        behavior        = "MAX_AGE"
        must_revalidate = false
        ttl             = "365d"
      }
    }
  }
}

data "akamai_property_rules_builder" "property_rule_css" {
  rules_v2024_08_13 {
    name                  = "css"
    criteria_must_satisfy = "all"
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "MATCHES_ONE_OF"
        normalize            = false
        values               = ["/static/*", ]
      }
    }
    behavior {
      caching {
        behavior        = "MAX_AGE"
        must_revalidate = false
        ttl             = "364d"
      }
    }
    behavior {
      downstream_cache {
        allow_behavior = "LESSER"
        behavior       = "ALLOW"
        send_headers   = "CACHE_CONTROL_AND_EXPIRES"
        send_private   = false
      }
    }
  }
}

data "akamai_property_rules_builder" "includes" {
  rules_v2024_08_13 {
    name                  = "Includes"
    criteria_must_satisfy = "all"
    children = [
      for key, value in data.akamai_property_rules_builder.include : value.json
    ]
  }
}

data "akamai_property_rules_builder" "include" {
  for_each = var.includes
  rules_v2024_08_13 {
    name                  = data.akamai_property_include.include[each.key].name
    criteria_must_satisfy = "all"
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "MATCHES_ONE_OF"
        normalize            = false
        values               = each.value
      }
    }
    behavior {
      include {
        id = trimprefix(each.key, "inc_")
      }
    }
  }
}

data "akamai_property_include" "include" {
  for_each    = var.includes
  contract_id = var.contract_id
  group_id    = var.group_id
  include_id  = each.key
}
