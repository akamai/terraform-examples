/**
 * # Create Best Practice Client Lists
 *
 * The use case for this module is to quickly create new Client Lists for an Application Security Configuration
 *
 * The following Client Lists are created:
 * * IP Block
 * * IP Block Exception
 * * Geo Block
 * * Security Bypass
 * * Rate Control Bypass
 * * Pragma Bypass
 * * Client Reputation Bypass
 */

resource "akamai_clientlist_list" "client-lists-ipblock" {
  name        = "${var.client_lists_prefix}-IP Block List"
  type        = "IP"
  notes       = "IP Block List for ${var.config_name}"
  tags        = []
  contract_id = var.contract_id
  group_id    = var.group_id
}

resource "akamai_clientlist_list" "client-lists-ipblock-list-exceptions" {
  name        = "${var.client_lists_prefix}-IP Block List Exceptions"
  type        = "IP"
  notes       = "IP Block List Exceptions for ${var.config_name}"
  tags        = []
  contract_id = var.contract_id
  group_id    = var.group_id
}

resource "akamai_clientlist_list" "client-lists-geoblock-list" {
  name        = "${var.client_lists_prefix}-GEO Block List"
  type        = "GEO"
  notes       = "GEO Block List for ${var.config_name}"
  tags        = []
  contract_id = var.contract_id
  group_id    = var.group_id
}

resource "akamai_clientlist_list" "client-lists-securitybypass-list" {
  name        = "${var.client_lists_prefix}-Security Bypass List"
  type        = "IP"
  notes       = "Security Bypass List for ${var.config_name}"
  tags        = []
  contract_id = var.contract_id
  group_id    = var.group_id
}

resource "akamai_clientlist_list" "client-lists-rcbypass-list" {
  name        = "${var.client_lists_prefix}-Rate Control Bypass List"
  type        = "IP"
  notes       = "Rate Control Bypass List for ${var.config_name}"
  tags        = []
  contract_id = var.contract_id
  group_id    = var.group_id
}

resource "akamai_clientlist_list" "client-lists-pragmabypass-list" {
  name        = "${var.client_lists_prefix}-Pragma Bypass List"
  type        = "IP"
  notes       = "Pragma Bypass List for ${var.config_name}"
  tags        = []
  contract_id = var.contract_id
  group_id    = var.group_id
}

resource "akamai_clientlist_list" "client-lists-reputationbypass-list" {
  name        = "${var.client_lists_prefix}-Reputation Bypass List"
  type        = "IP"
  notes       = "Reputation Bypass List for ${var.config_name}"
  tags        = []
  contract_id = var.contract_id
  group_id    = var.group_id
}
