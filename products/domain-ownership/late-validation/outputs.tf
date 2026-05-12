output "hostnames" {
  value = akamai_property.this.hostnames
  description = "Hostnames structure for demo purposes"
}

output "ca_validation_hostnames" {
  value = local.ca_validation_hostnames
  description = "Shows the list of hostnames to validate for CA certificates"
}

output "ca_validation_record" {
  value = local.ca_validation_records
  description = "Shows the CA validation records for each hostname"
}
