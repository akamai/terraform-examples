/*
* This is defines the centrally managed property. This will attach each PM Include within
* its rule tree. It's managed separately from the microservices includes and has its own
* state file. It obtains the ids of the attached includes via a remote state datasource
* This allows the individual microservices development teams to manage their own includes
* without having to share state with this centrally managed property
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
  edge_hostname = "${var.property_name}.edgesuite.net"
}

resource "akamai_property" "property" {
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

  rule_format = data.akamai_property_rules_builder.property_rule_default.rule_format
  rules       = data.akamai_property_rules_builder.property_rule_default.json
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "property-staging" {
  property_id                    = akamai_property.property.id
  contact                        = var.contacts
  version                        = akamai_property.property.latest_version
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = true
}

# NOTE: Be careful when removing this resource as you can disable traffic
#resource "akamai_property_activation" "property-production" {
#  property_id                    = akamai_property.property.id
#  contact                        = var.contacts
#  version                        = akamai_property.property.latest_version
#  network                        = "PRODUCTION"
#  auto_acknowledge_rule_warnings = true
#}
