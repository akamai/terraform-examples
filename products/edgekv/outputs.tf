
output "countries" {
  description = "Map of items for the countries group"
  value       = data.akamai_edgekv_group_items.countries_group
}

output "languages" {
  description = "Map of items for the languages group"
  value       = data.akamai_edgekv_group_items.translations_group
}
