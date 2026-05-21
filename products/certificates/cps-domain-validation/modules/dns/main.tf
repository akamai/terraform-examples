resource "akamai_dns_record" "validations" {
  for_each = toset(var.hostnames)

  zone       = var.zone
  name       = var.challenges[each.key].full_path
  recordtype = "TXT"
  target     = [var.challenges[each.key].response_body]
  ttl        = 1800
}

# The hostnames that were passed to us when we created these properties
output "hostnames" {
  value = var.hostnames
}
