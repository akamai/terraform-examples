/*
* # Property Manager: Rules as JSONNET
*
* This example shows how you can use Jsonnet to generate the rule tree JSON. This allows you take advantage of some of the useful features of the Jsonnet templating language, such as conditions and looping. However, in order to use this, you require a few prerequisites to be met.
*
* - Jsonnet must be installed. (You can read about this here)[https://github.com/google/jsonnet]
* - You need to set the JSONNET_PATH environment variable to point to the `jsonnet` directory here. This allows the Jsonnet application to find the papi schema file which is referenced in each file found in the rules folder. A version of the v2025-01-13 ruleFormat is included in this directory, but Jsonnet rules can use any ruleFormat you wish.
*
* The Akamai Jsonnet CLI can also be used to export properties and ruleFormats to be used in this way. (You can read about it here)[https://github.com/akamai/cli-jsonnet] 
*/

data "jsonnet_file" "rules" {
  ext_code = {
    default_origin = jsonencode(var.default_origin)
    default_cpcode = parseint(replace(akamai_cp_code.default.id, "cpc_", ""), 10)
  }

  source = "${path.module}/rules/rules.jsonnet"
}

resource "akamai_cp_code" "default" {
  name        = var.property_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
}

resource "akamai_property" "property" {
  name        = var.property_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
  rule_format = var.rule_format
  hostnames {
    cname_from             = var.hostname
    cname_to               = "${var.hostname}.edgesuite.net"
    cert_provisioning_type = "DEFAULT"
  }
  rules         = data.jsonnet_file.rules.rendered
  version_notes = var.notes
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "staging" {
  property_id                    = akamai_property.property.id
  contact                        = [var.email]
  version                        = var.activate_latest_on_staging ? akamai_property.property.latest_version : akamai_property.property.staging_version
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = true
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "production" {
  property_id                    = akamai_property.property.id
  contact                        = [var.email]
  version                        = var.activate_latest_on_production ? akamai_property.property.latest_version : akamai_property.property.production_version
  network                        = "PRODUCTION"
  auto_acknowledge_rule_warnings = true
}
