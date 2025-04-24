/*
* # Property Manager: Rules as HCL
*
* This module demonstrates how to create a Property by specifying the rules as Hashicorp Configuration Language (HCL)
*
*/

locals {
  ivm_images_cpcodes_count    = var.include_ivm_images ? 1 : 0
  production_version          = akamai_property.property.production_version != null ? akamai_property.property.production_version : 0
  production_activation_count = akamai_property.property.production_version != null ? 1 : 0
  staging_version             = akamai_property.property.staging_version != null ? akamai_property.property.staging_version : 0
  staging_activation_count    = akamai_property.property.staging_version != null ? 1 : 0
}

resource "akamai_cp_code" "default" {
  name        = var.property_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
}
resource "akamai_cp_code" "ivm_images_pristine" {
  name        = "${var.property_name}-ivm-pristine"
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
  count       = local.ivm_images_cpcodes_count
}
resource "akamai_cp_code" "ivm_images_derivative" {
  name        = "${var.property_name}-ivm-derivative"
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
  count       = local.ivm_images_cpcodes_count
}

module "rules" {
  source                        = "./rules"
  default_origin                = var.default_origin
  default_cpcode                = parseint(replace(akamai_cp_code.default.id, "cpc_", ""), 10)
  include_ivm_images            = var.include_ivm_images
  ivm_images_derivative_cp_code = var.include_ivm_images ? parseint(replace(akamai_cp_code.ivm_images_derivative[0].id, "cpc_", ""), 10) : 0
  ivm_images_pristine_cp_code   = var.include_ivm_images ? parseint(replace(akamai_cp_code.ivm_images_pristine[0].id, "cpc_", ""), 10) : 0
  ivm_images_policyset          = var.ivm_images_policyset
}

resource "akamai_property" "property" {
  name        = var.property_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
  hostnames {
    cname_from             = var.hostname
    cname_to               = "${var.hostname}.edgesuite.net"
    cert_provisioning_type = "DEFAULT"
  }
  rule_format   = module.rules.rule_format
  rules         = module.rules.rules
  version_notes = var.notes
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "staging" {
  property_id                    = akamai_property.property.id
  contact                        = [var.email]
  version                        = var.activate_latest_on_staging ? akamai_property.property.latest_version : local.staging_version
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = true
  # count = local.staging_activation_count
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "production" {
  property_id                    = akamai_property.property.id
  contact                        = [var.email]
  version                        = var.activate_latest_on_production ? akamai_property.property.latest_version : local.production_version
  network                        = "PRODUCTION"
  auto_acknowledge_rule_warnings = true
  count                          = local.production_activation_count
}
