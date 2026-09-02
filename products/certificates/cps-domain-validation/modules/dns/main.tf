resource "akamai_dns_record" "validations" {
  for_each = toset(var.hostnames)

  zone       = var.zone
  name       = try(var.challenges[each.key].full_path, "placeholder")
  recordtype = "TXT"
  target     = [try(var.challenges[each.key].response_body, "placeholder")]
  ttl        = 1800

  # Challenges disappear after validation; keep existing records unchanged rather than error or overwrite
  lifecycle {
    ignore_changes = [name, target]
  }
}

# The hostnames that were passed to us when we created these properties
output "hostnames" {
  value = var.hostnames
}
