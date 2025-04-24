// SIEM Settings
resource "akamai_appsec_siem_settings" "siem" {
  config_id               = akamai_appsec_configuration.config.config_id
  enable_siem             = var.enable_siem
  enable_for_all_policies = true
  enable_botman_siem      = false
  siem_id                 = 1
  security_policy_ids     = []
  count                   = local.siem_count
}
