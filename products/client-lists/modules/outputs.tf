output "client_lists_ipblock_id" {
  description = "ID for the IP Block Client List"
  value       = [akamai_clientlist_list.client-lists-ipblock.id]
}

output "client_lists_ipblock_exception_id" {
  description = "ID for the IP Block Exceptions Client List"
  value       = [akamai_clientlist_list.client-lists-ipblock-list-exceptions.id]
}

output "client_lists_geoblock_id" {
  description = "ID for the Geo Block Client List"
  value       = [akamai_clientlist_list.client-lists-geoblock-list.id]
}

output "client_lists_securitybypass_id" {
  description = "ID for the Security Bypass Client List"
  value       = [akamai_clientlist_list.client-lists-securitybypass-list.id]
}

output "client_lists_rcbypass_id" {
  description = "ID for the Rate Control Bypass Client List"
  value       = [akamai_clientlist_list.client-lists-rcbypass-list.id]
}

output "client_lists_pragmabypass_id" {
  description = "ID for the Pragma Bypass Client List"
  value       = [akamai_clientlist_list.client-lists-pragmabypass-list.id]
}

output "client_lists_reputationbypass_id" {
  description = "ID for the reputation Bypass Client List"
  value       = [akamai_clientlist_list.client-lists-reputationbypass-list.id]
}
