
data "akamai_property_rules_builder" "rule_augment_insights" {
  rules_v2025_01_13 {
    name                  = "Augment insights"
    comments              = "Control the settings related to monitoring and reporting. This gives you additional visibility into your traffic and audiences."
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.rule_traffic_reporting.json,
      data.akamai_property_rules_builder.rule_m_pulse_rum.json,
      data.akamai_property_rules_builder.rule_geolocation.json,
      data.akamai_property_rules_builder.rule_log_delivery.json,
    ]
  }
}
