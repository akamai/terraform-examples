data "akamai_appsec_configuration" "config" {
  name = var.config_name
}

resource "akamai_appsec_activations" "activation-staging" {
  config_id           = data.akamai_appsec_configuration.config.config_id
  network             = "STAGING"
  notification_emails = [var.email]
  note                = var.notes
  version             = data.akamai_appsec_configuration.config.latest_version
}

resource "akamai_appsec_activations" "activation-production" {
  config_id           = data.akamai_appsec_configuration.config.config_id
  network             = "PRODUCTION"
  notification_emails = [var.email]
  note                = var.notes
  version             = data.akamai_appsec_configuration.config.latest_version
}
