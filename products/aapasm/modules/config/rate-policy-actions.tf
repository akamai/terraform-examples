// Rate Policy Actions
resource "akamai_appsec_rate_policy_action" "policy_origin-error" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_rate_protection.policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.origin_error.rate_policy_id
  ipv4_action        = "alert"
  ipv6_action        = "alert"
  depends_on = [
    akamai_appsec_rate_protection.policy
  ]
}

resource "akamai_appsec_rate_policy_action" "policy_page_view_requests" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_rate_protection.policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.page_view_requests.rate_policy_id
  ipv4_action        = "alert"
  ipv6_action        = "alert"
  depends_on = [
    akamai_appsec_rate_protection.policy
  ]
}

resource "akamai_appsec_rate_policy_action" "policy_post_requests" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_rate_protection.policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.post_requests.rate_policy_id
  ipv4_action        = "alert"
  ipv6_action        = "alert"
  depends_on = [
    akamai_appsec_rate_protection.policy
  ]
}

resource "akamai_appsec_rate_policy_action" "policy_forward_requests" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_rate_protection.policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.forward_requests.rate_policy_id
  ipv4_action        = "alert"
  ipv6_action        = "alert"
  depends_on = [
    akamai_appsec_rate_protection.policy
  ]
}