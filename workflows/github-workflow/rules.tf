
data "akamai_property_rules_builder" "github-workflow-tf-demo_rule_default" {
  rules_v2024_02_12 {
    name      = "default"
    is_secure = false
    behavior {
      origin_characteristics {
        access_key_encrypted_storage = true
        authentication_method        = "AWS"
        authentication_method_title  = ""
        aws_access_key_version_guid  = var.cam_key_guid
        aws_host                     = ""
        aws_region                   = "eu-central-1"
        aws_service                  = "s3"
        country                      = "GLOBAL_MULTI_GEO"
        origin_location_title        = ""
      }
    }
    behavior {
      content_characteristics_dd {
        catalog_size            = "MEDIUM"
        content_type            = "SOFTWARE"
        object_size             = "LESS_THAN_1MB"
        optimize_option         = false
        popularity_distribution = "ALL_POPULAR"
      }
    }
    behavior {
      client_characteristics {
        country = "GLOBAL"
      }
    }
    behavior {
      origin {
        cache_key_hostname            = "ORIGIN_HOSTNAME"
        compress                      = true
        enable_true_client_ip         = true
        forward_host_header           = "REQUEST_HOST_HEADER"
        hostname                      = var.origin_hostname
        http_port                     = 80
        https_port                    = 443
        ip_version                    = "IPV4"
        min_tls_version               = "DYNAMIC"
        origin_certificate            = ""
        origin_sni                    = true
        origin_type                   = "CUSTOMER"
        ports                         = ""
        tls13_support                 = false
        tls_version_title             = ""
        true_client_ip_client_setting = false
        true_client_ip_header         = "True-Client-IP"
        verification_mode             = "PLATFORM_SETTINGS"
      }
    }
    behavior {
      cp_code {
        value {
          description = var.cp_code_name
          id          = akamai_cp_code.cp-code.id
          name        = var.cp_code_name
          products    = [var.product_id, ]
        }
      }
    }
    behavior {
      cache_key_query_params {
        behavior = "IGNORE_ALL"
      }
    }
    behavior {
      dynamic_throughtput_optimization {
        enabled = true
      }
    }
    behavior {
      http3 {
        enable = true
      }
    }
    children = [
      data.akamai_property_rules_builder.github-workflow-tf-demo_rule_redirect_to_https.json,
      data.akamai_property_rules_builder.github-workflow-tf-demo_rule_completely_static_content.json,
    ]
  }
}

data "akamai_property_rules_builder" "github-workflow-tf-demo_rule_redirect_to_https" {
  rules_v2024_02_12 {
    name                  = "Redirect to HTTPS"
    comments              = "Redirect to the same URL on HTTPS protocol, issuing a 301 response code (Moved Permanently). You may change the response code to 302 if needed."
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

data "akamai_property_rules_builder" "github-workflow-tf-demo_rule_completely_static_content" {
  rules_v2024_02_12 {
    name                  = "Completely Static Content"
    criteria_must_satisfy = "any"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["mp3", "mp4", "css", "gif", "jpg", "js", "png", "pict", "tif", "tiff", "mid", "midi", "ttf", "eot", "woff", "woff2", "otf", "svg", "svgz", "webp", "jxr", "class", "jar", "jp2", ]
      }
    }
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "MATCHES_ONE_OF"
        normalize            = false
        values               = ["/examplepath/*", ]
      }
    }
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "DOES_NOT_MATCH_ONE_OF"
        normalize            = false
        values               = ["/examplepath/exception/*", ]
      }
    }
    behavior {
      caching {
        behavior        = "MAX_AGE"
        must_revalidate = false
        ttl             = "10d"
      }
    }
  }
}
