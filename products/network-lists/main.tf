/*
* # Network Lists Module
*
*/

data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "akamai_networklist_network_list" "ip_block_list" {
  name        = "${var.prefix} - IP Block List"
  type        = "IP"
  description = "IP block list for config ${var.prefix}"
  mode        = "APPEND"
  contract_id = trimprefix(data.akamai_contract.contract.id, "ctr_")
  group_id    = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  list        = var.ip_block_list
}

resource "akamai_networklist_network_list" "ip_block_list_exceptions" {
  name        = "${var.prefix} - IP Block List Exceptions"
  type        = "IP"
  description = "Block list exceptions for config ${var.prefix}"
  mode        = "APPEND"
  contract_id = trimprefix(data.akamai_contract.contract.id, "ctr_")
  group_id    = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  list        = var.ip_block_list_exceptions
}

resource "akamai_networklist_network_list" "geo_block_list" {
  name        = "${var.prefix} - Geo Block List"
  type        = "GEO"
  description = "Geo block list for config ${var.prefix}"
  mode        = "APPEND"
  contract_id = trimprefix(data.akamai_contract.contract.id, "ctr_")
  group_id    = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  list        = var.geo_block_list
}

resource "akamai_networklist_network_list" "security_bypass_list" {
  name        = "${var.prefix} - Security Bypass List"
  type        = "IP"
  description = "Block list exceptions for config ${var.prefix}"
  mode        = "APPEND"
  contract_id = trimprefix(data.akamai_contract.contract.id, "ctr_")
  group_id    = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  list        = var.security_bypass_list
}

resource "akamai_networklist_network_list" "rate_bypass_list" {
  name        = "${var.prefix} - Rate Control Bypass List"
  type        = "IP"
  description = "Rate Control Bypass List for config ${var.prefix}"
  mode        = "APPEND"
  contract_id = trimprefix(data.akamai_contract.contract.id, "ctr_")
  group_id    = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  list        = var.rate_bypass_list
}

resource "akamai_networklist_network_list" "pragma_exceptions" {
  name        = "${var.prefix} - Pragma Removal Exceptions"
  type        = "IP"
  description = "Pragma header removal exceptions for config ${var.prefix}"
  mode        = "APPEND"
  contract_id = trimprefix(data.akamai_contract.contract.id, "ctr_")
  group_id    = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  list        = var.pragma_exceptions
}


# ## Staging activations
# resource "akamai_networklist_activations" "ip_block_list_staging" {
#   network_list_id     = akamai_networklist_network_list.ip_block_list.network_list_id
#   network             = "STAGING"
#   sync_point          = akamai_networklist_network_list.ip_block_list.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "ip_block_list_exceptions_staging" {
#   network_list_id     = akamai_networklist_network_list.ip_block_list_exceptions.network_list_id
#   network             = "STAGING"
#   sync_point          = akamai_networklist_network_list.ip_block_list_exceptions.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "geo_block_list_staging" {
#   network_list_id     = akamai_networklist_network_list.geo_block_list.network_list_id
#   network             = "STAGING"
#   sync_point          = akamai_networklist_network_list.geo_block_list.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "security_bypass_list_staging" {
#   network_list_id     = akamai_networklist_network_list.security_bypass_list.network_list_id
#   network             = "STAGING"
#   sync_point          = akamai_networklist_network_list.security_bypass_list.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "rate_bypass_list_staging" {
#   network_list_id     = akamai_networklist_network_list.rate_bypass_list.network_list_id
#   network             = "STAGING"
#   sync_point          = akamai_networklist_network_list.rate_bypass_list.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "pragma_exceptions_staging" {
#   network_list_id     = akamai_networklist_network_list.pragma_exceptions.network_list_id
#   network             = "STAGING"
#   sync_point          = akamai_networklist_network_list.pragma_exceptions.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# ## Production activations
# resource "akamai_networklist_activations" "ip_block_list_production" {
#   network_list_id     = akamai_networklist_network_list.ip_block_list.network_list_id
#   network             = "PRODUCTION"
#   sync_point          = akamai_networklist_network_list.ip_block_list.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "ip_block_list_exceptions_production" {
#   network_list_id     = akamai_networklist_network_list.ip_block_list_exceptions.network_list_id
#   network             = "PRODUCTION"
#   sync_point          = akamai_networklist_network_list.ip_block_list_exceptions.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "geo_block_list_production" {
#   network_list_id     = akamai_networklist_network_list.geo_block_list.network_list_id
#   network             = "PRODUCTION"
#   sync_point          = akamai_networklist_network_list.geo_block_list.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "security_bypass_list_production" {
#   network_list_id     = akamai_networklist_network_list.security_bypass_list.network_list_id
#   network             = "PRODUCTION"
#   sync_point          = akamai_networklist_network_list.security_bypass_list.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "rate_bypass_list_production" {
#   network_list_id     = akamai_networklist_network_list.rate_bypass_list.network_list_id
#   network             = "PRODUCTION"
#   sync_point          = akamai_networklist_network_list.rate_bypass_list.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }

# resource "akamai_networklist_activations" "pragma_exceptions_production" {
#   network_list_id     = akamai_networklist_network_list.pragma_exceptions.network_list_id
#   network             = "PRODUCTION"
#   sync_point          = akamai_networklist_network_list.pragma_exceptions.sync_point
#   notes               = "Automated Terraform push"
#   notification_emails = var.emails
# }
