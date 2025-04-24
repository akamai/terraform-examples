output "all_fields" {
  description = "All Datastream Fields"
  value       = data.akamai_datastream_dataset_fields.all_fields
}

output "my_property_ids" {
  description = "Property Ids"
  value       = data.akamai_property.properties[*].id
}

output "datastream_info" {
  description = "Datastream Info"
  value       = akamai_datastream.my_datastream
  sensitive   = true
}

output "my_datastreams" {
  description = "All Datastreams"
  value       = data.akamai_datastreams.my_datastreams
}

output "datastream_id" {
  description = "Datastream ID"
  value       = local.datastream_id
}
