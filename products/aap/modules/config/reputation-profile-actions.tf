resource "akamai_appsec_reputation_profile_action" "policy_dos_attackers_high_threat_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_high_threat_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_dos_attackers_high_threat_non_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_high_threat_non_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_dos_attackers_low_threat_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_low_threat_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_dos_attackers_low_threat_non_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_low_threat_non_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_scanning_tools_high_threat_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_high_threat_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_scanning_tools_high_threat_non_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_high_threat_non_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_scanning_tools_low_threat_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_low_threat_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_scanning_tools_low_threat_non_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_low_threat_non_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_web_attackers_high_threat_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_high_threat_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_web_attackers_high_threat_non_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_high_threat_non_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_web_attackers_low_threat_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_low_threat_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_web_attackers_low_threat_non_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_low_threat_non_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_web_scrapers_high_threat_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_high_threat_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_web_scrapers_high_threat_non_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_high_threat_non_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_web_scrapers_low_threat_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_low_threat_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}

resource "akamai_appsec_reputation_profile_action" "policy_web_scrapers_low_threat_non_shared" {
  config_id             = akamai_appsec_configuration.config.config_id
  security_policy_id    = akamai_appsec_rate_protection.policy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_low_threat_non_shared[0].reputation_profile_id
  action                = "alert"
  count                 = local.client_rep_count
}
