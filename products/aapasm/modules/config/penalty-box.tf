// Penalty Box
resource "akamai_appsec_penalty_box" "policy" {
  config_id              = akamai_appsec_configuration.config.config_id
  security_policy_id     = akamai_appsec_security_policy.policy.security_policy_id
  penalty_box_protection = true
  penalty_box_action     = "alert"
}

