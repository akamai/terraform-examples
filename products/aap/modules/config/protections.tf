// Enable/Disable Protections for policy policy
resource "akamai_appsec_waf_protection" "policy" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_security_policy.policy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_ip_geo_protection" "policy" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_malware_protection" "policy" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_ip_geo_protection.policy.security_policy_id
  enabled            = false
}

resource "akamai_appsec_rate_protection" "policy" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_malware_protection.policy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_slowpost_protection" "policy" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_malware_protection.policy.security_policy_id
  enabled            = var.enable_slow_post
}

resource "akamai_appsec_reputation_protection" "policy" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_slowpost_protection.policy.security_policy_id
  enabled            = var.enable_client_rep
  count              = local.client_rep_count
}

