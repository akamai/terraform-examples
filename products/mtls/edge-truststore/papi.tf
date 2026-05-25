/** This example presents a sample workflow for configuring a property that enforces the mTLS Truststore behavior.
 *
 * Before applying this example, make changes to the attribute values according to your needs.
 *
 * A successful operation creates an edge hostname, CP code, and property with the mTLS Truststore behavior enabled, and activates that property on `STAGING` and `PRODUCTION` environments.
*/


resource "akamai_edge_hostname" "aka_edgehost" {
  depends_on    = [akamai_cps_third_party_enrollment.enrollment]
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_contract.contract.group_id
  product_id    = var.product_id
  edge_hostname = "${var.hostname}.edgekey.net"
  certificate   = akamai_cps_third_party_enrollment.enrollment.id
  ip_behavior   = "IPV4"
}

resource "akamai_property" "property" {
  name        = var.property_name
  product_id  = var.product_id
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_contract.contract.group_id
  hostnames {
    cname_from             = var.hostname
    cname_to               = akamai_edge_hostname.aka_edgehost.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  rule_format = data.akamai_property_rules_builder.full_mtls_workflow_rule_default.rule_format
  rules       = data.akamai_property_rules_builder.full_mtls_workflow_rule_default.json
}

# resource "akamai_property_activation" "property_activate_staging" {
#   contact                        = var.emails
#   network                        = "STAGING"
#   property_id                    = akamai_property.property.id
#   version                        = akamai_property.property.latest_version
#   auto_acknowledge_rule_warnings = true
# }

# resource "akamai_property_activation" "property_activate_production" {
#   contact                        = var.emails
#   network                        = "PRODUCTION"
#   property_id                    = akamai_property.property.id
#   version                        = akamai_property.property.latest_version
#   auto_acknowledge_rule_warnings = true
# }