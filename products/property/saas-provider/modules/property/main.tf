/*
* # Property Manager: SaaS Provider
*
* This modules shows a use-case where a SaaS provider will have a single property for
* their application and customer hostnames get added on an adhoc basis. This module will
* create the Property Manager configuration, add the list of hostnames to it, and return
* a map of challenges for validating the certificate for each hostname. The map key is
* the acme challenge "hostname" and the value is the "target".
*
* This modules deliberately does not activate the Property Manager configuration to
* production because it's likely you're going to want to delay that until the certificate
* has deployed
*/

resource "akamai_cp_code" "default" {
  name        = var.property_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
}

resource "akamai_edge_hostname" "edgehostname_edgesuite_net" {
  contract_id   = var.contract_id
  group_id      = var.group_id
  product_id    = var.product_id
  ip_behavior   = "IPV6_COMPLIANCE"
  edge_hostname = "${var.edge_hostname}.edgesuite.net"
}

resource "akamai_property" "saas_config" {
  name        = var.property_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id

  # For this use-case, each hostname will use the same edge hostname
  dynamic "hostnames" {
    for_each = var.hostnames
    content {
      cname_from             = hostnames.value
      cname_to               = akamai_edge_hostname.edgehostname_edgesuite_net.edge_hostname
      cert_provisioning_type = "DEFAULT"
    }
  }

  rule_format = data.akamai_property_rules_builder.saas_config_rule_default.rule_format
  rules       = data.akamai_property_rules_builder.saas_config_rule_default.json
}

# The hostnames that were passed to us when we created these properties
output "hostnames" {
  value = var.hostnames
}

# A list of DNS CNAME domain validation challenges where each entry is an object that contains "hostname" and "target"
output "challenges" {
  value = {
    for entry in akamai_property.saas_config.hostnames :
    entry.cert_status[0].hostname => entry.cert_status[0].target
  }
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "saas_config-staging" {
  property_id                    = akamai_property.saas_config.id
  contact                        = var.contacts
  version                        = akamai_property.saas_config.latest_version
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = true
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "saas_config-production" {
  property_id                    = akamai_property.saas_config.id
  contact                        = var.contacts
  version                        = akamai_property.saas_config.latest_version
  network                        = "PRODUCTION"
  auto_acknowledge_rule_warnings = true
  dynamic "compliance_record" {
    for_each = var.compliance_record != null ? [1] : []
    content {
      dynamic "noncompliance_reason_none" {
        for_each = var.compliance_record.reason == "none" ? [1] : []
        content {
          customer_email   = var.compliance_record.customer_email
          peer_reviewed_by = var.compliance_record.peer_reviewed_by
          unit_tested      = var.compliance_record.unit_tested
        }
      }

      dynamic "noncompliance_reason_no_production_traffic" {
        for_each = var.compliance_record.reason == "no_production_traffic" ? [1] : []
        content {
        }
      }
    }
  }
}
