
data "akamai_property_rules_builder" "rule_default" {
  rules_v2026_02_16 {
    name      = "default"
    is_secure = false
    comments  = "The Default Rule template contains all the necessary and recommended behaviors. Rules are evaluated from top to bottom and the last matching rule wins."
    behavior {
      origin {
        cache_key_hostname            = "ORIGIN_HOSTNAME"
        compress                      = true
        enable_true_client_ip         = true
        forward_host_header           = "REQUEST_HOST_HEADER"
        hostname                      = "origin.example.com"
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
      cp_code {
        enable_default_content_provider_code = true
      }
    }
    behavior {
      caching {
        behavior = "NO_STORE"
      }
    }
    children = [
      data.akamai_property_rules_builder.keystore.json,
    ]
  }
}

data "akamai_property_rules_builder" "keystore" {
  rules_v2026_02_16 {
    name                  = "keystore"
    criteria_must_satisfy = "all"
    behavior {
      mtls_origin_keystore {
        auth_client_cert                = false
        client_certificate_version_guid = akamai_mtlskeystore_client_certificate_akamai.akamai_cert.current_guid
        enable                          = true
      }
    }
  }
}