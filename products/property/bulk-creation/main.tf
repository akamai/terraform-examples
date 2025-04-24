/**
* # Property Creation in Bulk
*
* Terraform can also be used for bulk operations such as onboardings or modifications. This template creates 3 new properties during a single `terraform apply` for properties named after `dev`, `qa`, and `test`. However, these properties can be different apps (e.g. www, login, api, etc), not necessarily different testing environments. 
* By using the `for_each` meta-argument all the resources are created during a single `terraform apply` as opposed to other multi-environment setups where each configuration can be deployed independently. The latter is more convenient for day to day operations. 
*/

data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "akamai_cp_code" "cp_code" {

  for_each = var.properties

  product_id  = var.product_id
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_contract.contract.group_id
  name        = each.value.cpcode_name
}

resource "akamai_edge_hostname" "my_edge_hostname" {

  for_each = var.properties

  #product_id    = var.product_id
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_contract.contract.group_id
  ip_behavior   = var.edge_hostname_ip_behavior
  edge_hostname = each.value.edge_hostname
  certificate   = var.certificate
}

resource "akamai_property" "my_property" {

  for_each = var.properties

  name        = "${each.key}${var.domain}"
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_contract.contract.group_id
  product_id  = var.product_id

  dynamic "hostnames" {
    for_each = each.value.hostnames
    content {
      cname_from             = hostnames.value
      cname_to               = akamai_edge_hostname.my_edge_hostname[each.key].edge_hostname
      cert_provisioning_type = "DEFAULT"
    }
  }
  rule_format   = data.akamai_property_rules_builder.my_property_rule_default[each.key].rule_format
  rules         = data.akamai_property_rules_builder.my_property_rule_default[each.key].json
  version_notes = var.version_notes
  # Version notes depend on values that change on every commit. Ignoring notes as a valid change
  lifecycle {
    ignore_changes = [
      version_notes,
    ]
  }
}

resource "akamai_property_activation" "my_property_activation_staging" {

  for_each = var.properties

  property_id                    = akamai_property.my_property[each.key].id
  contact                        = [var.email]
  version                        = var.activate_property_on_staging ? akamai_property.my_property[each.key].latest_version : akamai_property.my_property[each.key].staging_version
  network                        = "STAGING"
  note                           = var.version_notes
  auto_acknowledge_rule_warnings = true

  # Activation notes depend on values that change on every commit. Ignoring notes as valid change
  lifecycle {
    ignore_changes = [
      note,
    ]
  }
}

resource "akamai_property_activation" "my_property_activation_production" {

  for_each = var.properties

  property_id                    = akamai_property.my_property[each.key].id
  contact                        = [var.email]
  version                        = var.activate_property_on_production ? akamai_property.my_property[each.key].latest_version : akamai_property.my_property[each.key].production_version
  network                        = "PRODUCTION"
  auto_acknowledge_rule_warnings = true
  note                           = var.version_notes

  # Activation notes depend on values that change on every commit. Ignoring notes as valid change
  lifecycle {
    ignore_changes = [
      note,
    ]
  }
  compliance_record {
    noncompliance_reason_no_production_traffic {
      ticket_id = "123"
    }
  }

}
