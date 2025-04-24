output "ip_block_list_id" {
  value = akamai_networklist_network_list.ip_block_list.id
}

output "ip_block_list_exceptions_id" {
  value = akamai_networklist_network_list.ip_block_list_exceptions.id
}

output "geo_block_list_id" {
  value = akamai_networklist_network_list.geo_block_list.id
}

output "security_bypass_list_id" {
  value = akamai_networklist_network_list.security_bypass_list.id
}

output "rate_bypass_list_id" {
  value = akamai_networklist_network_list.rate_bypass_list.id
}

output "pragma_exceptions_id" {
  value = akamai_networklist_network_list.pragma_exceptions.id
}
