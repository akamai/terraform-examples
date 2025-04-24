resource "akamai_appsec_security_policy" "policy" {
  config_id              = akamai_appsec_configuration.config.config_id
  default_settings       = true
  security_policy_name   = var.policy_name
  security_policy_prefix = var.policy_prefix
}

