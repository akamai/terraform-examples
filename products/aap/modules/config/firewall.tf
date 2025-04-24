// IP/GEO Firewall
resource "akamai_appsec_ip_geo" "policy" {
  config_id                  = akamai_appsec_configuration.config.config_id
  security_policy_id         = akamai_appsec_ip_geo_protection.policy.security_policy_id
  mode                       = "block"
  geo_network_lists          = ["${var.geo_block_list_id}"]
  ip_network_lists           = ["${var.ip_block_list_id}"]
  exception_ip_network_lists = ["${var.ip_block_list_exceptions_id}"]
  ukraine_geo_control_action = "none"
}



