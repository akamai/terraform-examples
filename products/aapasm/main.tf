/*
* # App & API Protector with Advanced Security Module
* 
* This module will create an AAP/ASM config with input variables to control the following features:
* 
* - SIEM
* - Client Reputation
* - Slow Post Detection
* 
*/

module "config" {
  source                      = "./modules/config"
  notes                       = var.notes
  contract_id                 = var.contract_id
  group_id                    = var.group_id
  config_name                 = var.config_name
  config_description          = var.config_description
  hostnames                   = [var.hostname]
  policy_name                 = var.policy_name
  policy_prefix               = var.policy_prefix
  ip_block_list_id            = var.ip_block_list_id
  ip_block_list_exceptions_id = var.ip_block_list_exceptions_id
  geo_block_list_id           = var.geo_block_list_id
  security_bypass_list_id     = var.security_bypass_list_id
  rate_bypass_list_id         = var.rate_bypass_list_id
  pragma_exceptions_id        = var.pragma_exceptions_id
  enable_siem                 = var.enable_siem
  enable_client_rep           = var.enable_client_rep
  enable_slow_post            = var.enable_slow_post
}

module "activation" {
  source      = "./modules/activation"
  config_name = var.config_name
  email       = var.email
  notes       = var.notes
  depends_on = [
    module.config
  ]
}
