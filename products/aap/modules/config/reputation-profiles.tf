resource "akamai_appsec_reputation_profile" "dos_attackers_high_threat_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/dos_attackers_high_threat_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "dos_attackers_high_threat_non_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/dos_attackers_high_threat_non_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "dos_attackers_low_threat_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/dos_attackers_low_threat_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "dos_attackers_low_threat_non_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/dos_attackers_low_threat_non_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "scanning_tools_high_threat_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/scanning_tools_high_threat_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "scanning_tools_high_threat_non_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/scanning_tools_high_threat_non_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "scanning_tools_low_threat_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/scanning_tools_low_threat_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "scanning_tools_low_threat_non_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/scanning_tools_low_threat_non_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "web_attackers_high_threat_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/web_attackers_high_threat_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "web_attackers_high_threat_non_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/web_attackers_high_threat_non_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "web_attackers_low_threat_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/web_attackers_low_threat_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "web_attackers_low_threat_non_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/web_attackers_low_threat_non_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "web_scrapers_high_threat_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/web_scrapers_high_threat_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "web_scrapers_high_threat_non_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/web_scrapers_high_threat_non_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "web_scrapers_low_threat_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/web_scrapers_low_threat_shared.json")
  count              = local.client_rep_count
}

resource "akamai_appsec_reputation_profile" "web_scrapers_low_threat_non_shared" {
  config_id          = akamai_appsec_configuration.config.config_id
  reputation_profile = file("${path.module}/reputation-profiles/web_scrapers_low_threat_non_shared.json")
  count              = local.client_rep_count
}
