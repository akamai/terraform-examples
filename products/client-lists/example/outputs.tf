output "client_lists_ipblock_id" {
  description = "ID for the IP Block Client List"
  value       = module.client-lists.client_lists_ipblock_id
}

output "client_lists_ipblock_exception_id" {
  description = "ID for the IP Block Exceptions Client List"
  value       = module.client-lists.client_lists_ipblock_exception_id
}

output "client_lists_geoblock_id" {
  description = "ID for the Geo Block Client List"
  value       = module.client-lists.client_lists_geoblock_id
}

output "client_lists_securitybypass_id" {
  description = "ID for the Security Bypass Client List"
  value       = module.client-lists.client_lists_securitybypass_id
}

output "client_lists_rcbypass_id" {
  description = "ID for the Rate Control Bypass Client List"
  value       = module.client-lists.client_lists_rcbypass_id
}

output "client_lists_pragmabypass_id" {
  description = "ID for the Pragma Bypass Client List"
  value       = module.client-lists.client_lists_pragmabypass_id
}

output "client_lists_reputationbypass_id" {
  description = "ID for the reputation Bypass Client List"
  value       = module.client-lists.client_lists_reputationbypass_id
}
