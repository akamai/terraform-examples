
data "akamai_property_rules_builder" "rule_m_pulse_rum" {
  rules_v2025_01_13 {
    name                  = "mPulse RUM"
    comments              = "Collect and analyze real-user data to monitor the performance of your website."
    criteria_must_satisfy = "all"
    behavior {
      m_pulse {
        api_key         = ""
        buffer_size     = ""
        config_override = ""
        enabled         = true
        loader_version  = "V12"
        require_pci     = false
        title_optional  = ""
      }
    }
  }
}
