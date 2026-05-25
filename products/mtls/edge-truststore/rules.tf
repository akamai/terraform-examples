/**
 * This example presents a sample workflow for building property rules with the mTLS Truststore behavior enabled.
 *
 * Before applying this example, make changes to the attribute values according to your needs.
 * To configure base settings for mTLS Truststore, use the `enforce_mtls_settings` behavior and the `request_header` criterion.
 * For more custom settings, add additional features to your rules, including the `client_certificate` criterion, and the `client_certificate_auth` and `log_custom` behaviors.
 *
 * A successful operation creates property rules with the mTLS Truststore behavior enabled.
 *
 * You can use the created rules to enforce mTLS Truststore settings on the property.
*/


data "akamai_property_rules_builder" "full_mtls_workflow_rule_default" {
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
      data.akamai_property_rules_builder.full_mtls_workflow_rule_m_tls_settings_enforcement_base.json,
    ]
  }
}

data "akamai_property_rules_builder" "full_mtls_workflow_rule_m_tls_settings_enforcement_base" {
  rules_v2026_02_16 {
    name                  = "mTLS Settings Enforcement – Base"
    criteria_must_satisfy = "any"
    criterion {
      request_header {
        header_name                = "test_1"
        match_case_sensitive_value = true
        match_operator             = "IS_ONE_OF"
        match_wildcard_name        = false
        match_wildcard_value       = false
        values                     = ["ON", ]
      }
    }
    behavior {
      enforce_mtls_settings {
        certificate_authority_set = [akamai_mtlstruststore_ca_set_activation.ca_set_activation_production.ca_set_id, ]
        enable_auth_set           = true
        enable_deny_request       = false
        enable_ocsp_status        = false
      }
    }
    children = [
      data.akamai_property_rules_builder.full_mtls_workflow_rule_m_tls_settings_enforcement_custom.json,
    ]
  }
}

data "akamai_property_rules_builder" "full_mtls_workflow_rule_m_tls_settings_enforcement_custom" {
  rules_v2026_02_16 {
    name                  = "Client Certificate Settings – Custom"
    criteria_must_satisfy = "all"
    criterion {
      client_certificate {
        enforce_mtls = "FAIL"
      }
    }
    behavior {
      client_certificate_auth {
        client_certificate_attributes               = []
        enable                                      = true
        enable_client_certificate_validation_status = true
        enable_complete_client_certificate          = true
      }
    }
  }
}
