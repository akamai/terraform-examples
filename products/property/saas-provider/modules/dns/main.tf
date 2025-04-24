resource "akamai_dns_record" "validations" {
  for_each = toset(var.hostnames)

  zone       = var.zone
  name       = "_acme-challenge.${each.key}"
  recordtype = "CNAME"
  target     = [var.challenges["_acme-challenge.${each.key}"]]
  ttl        = 1800
}

# The hostnames that were passed to us when we created these properties
output "hostnames" {
  value = var.hostnames
}
