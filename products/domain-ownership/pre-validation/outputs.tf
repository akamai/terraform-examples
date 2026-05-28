output "challenges" {
  value = akamai_property_domainownership_domains.dom_domains
}

output "txt_records" {
  value = [
    for key, instance in akamai_property_domainownership_domains.dom_domains : {
      domain_name = one(instance.domains).domain_name
      txt_record  = one(instance.domains).validation_challenge.txt_record.value
    }
  ]
}