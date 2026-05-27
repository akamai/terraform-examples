/**
* # Multi Pipeline "dev" Example
*
*/

locals {
  sanitized_project_name = replace(replace(var.project_name, "-", "_"), " ", "_")
}

module "certificate" {
  source       = "../../../products/certificate/dv"
  contract_id  = var.contract_id
  group_id     = var.group_id
  hostname     = var.hostname
  enhanced_tls = var.enhanced_tls
}

module "network-lists" {
  source                   = "../../../products/network-lists"
  group_name               = var.group_name
  prefix                   = local.sanitized_project_name
  ip_block_list            = var.ip_block_list
  ip_block_list_exceptions = var.ip_block_list_exceptions
  geo_block_list           = var.geo_block_list
  security_bypass_list     = var.security_bypass_list
  rate_bypass_list         = var.rate_bypass_list
  pragma_exceptions        = var.pragma_exceptions
  emails                   = [var.email]
  akamai_client_token      = var.akamai_client_token
  akamai_client_secret     = var.akamai_client_secret
  akamai_host              = var.akamai_host
  akamai_access_token      = var.akamai_access_token
}

module "property" {
  source                 = "../../../products/property/rules-as-hcl"
  property_name          = var.project_name
  group_name             = var.group_name
  product_id             = var.product_id
  hostname               = var.hostname
  rule_format            = var.rule_format
  contacts               = [var.email]
  default_origin         = var.default_origin
  sure_route_test_object = var.sure_route_test_object
  td_region              = var.td_region
  include_ivm_images     = false
  akamai_client_token    = var.akamai_client_token
  akamai_client_secret   = var.akamai_client_secret
  akamai_host            = var.akamai_host
  akamai_access_token    = var.akamai_access_token
  depends_on = [
    module.certificate,
  ]
}

module "aap" {
  source                      = "../../../products/aapasm"
  contract_id                 = var.contract_id
  group_id                    = var.group_id
  hostname                    = var.hostname
  config_name                 = local.sanitized_project_name
  config_description          = var.security_config_description
  notes                       = var.notes
  email                       = var.email
  akamai_client_token         = var.akamai_client_token
  akamai_client_secret        = var.akamai_client_secret
  akamai_host                 = var.akamai_host
  akamai_access_token         = var.akamai_access_token
  ip_block_list_id            = module.network-lists.ip_block_list_id
  ip_block_list_exceptions_id = module.network-lists.ip_block_list_exceptions_id
  geo_block_list_id           = module.network-lists.geo_block_list_id
  security_bypass_list_id     = module.network-lists.security_bypass_list_id
  rate_bypass_list_id         = module.network-lists.rate_bypass_list_id
  pragma_exceptions_id        = module.network-lists.pragma_exceptions_id
  depends_on = [
    module.network-lists,
    module.property
  ]
}
