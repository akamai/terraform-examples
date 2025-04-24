
data "akamai_property_rules_builder" "rule_default" {
  rules_v2025_01_13 {
    name      = "default"
    is_secure = false
    comments  = "The Default Rule template contains all the necessary and recommended behaviors. Rules are evaluated from top to bottom and the last matching rule wins."
    behavior {
      origin {
        cache_key_hostname            = "REQUEST_HOST_HEADER"
        compress                      = true
        enable_true_client_ip         = true
        forward_host_header           = "ORIGIN_HOSTNAME"
        hostname                      = var.default_origin
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
    behavior {
      http3 {
        enable = true
      }
    }
    behavior {
      auto_domain_validation {
        autodv = ""
      }
    }
    children = compact([
      data.akamai_property_rules_builder.rule_augment_insights.json,
      data.akamai_property_rules_builder.rule_accelerate_delivery.json,
      data.akamai_property_rules_builder.rule_offload_origin.json,
      data.akamai_property_rules_builder.rule_strengthen_security.json,
      data.akamai_property_rules_builder.rule_increase_availability.json,
      data.akamai_property_rules_builder.rule_minimize_payload.json,
      var.include_ivm_images ? data.akamai_property_rules_builder.property_rule_image_and_video_manager_-_images-.json : null,
    ])
  }
}
