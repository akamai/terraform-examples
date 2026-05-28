/**
 * # Domain Ownership Manager Pre-Validation Example
 *
 * This module registers domains with Akamai's Domain Ownership Manager and automates
 * DNS-based validation **before** any property or certificate provisioning takes place.
 *
 * ## Workflow
 *
 * Resources must be applied in two steps due to the dependency on DNS propagation:
 *
 * 1. `akamai_property_domainownership_domains` registers each domain and returns the
 *    DNS challenge data (CNAME record name and target).
 * 2. `akamai_dns_record` creates a CNAME record per domain using the challenge values.
 * 3. `time_sleep` waits for DNS propagation so Akamai's infrastructure can resolve
 *    the records before validation is triggered.
 * 4. `akamai_property_domainownership_validation` signals Akamai to perform the
 *    validation check, completing the pre-validation flow.
 *
 * ## ⚠️ Domain Ownership Validation
 *
 * Each domain is registered and validated independently. `for_each` is used on all
 * resources so that adding or removing a single domain only affects that domain's
 * state objects, leaving all other domains untouched.
 *
 * The DNS CNAME challenge records must be resolvable by Akamai's validation
 * infrastructure before `akamai_property_domainownership_validation` is invoked.
 * The `time_sleep` resource provides a buffer for propagation; adjust
 * `create_duration` if validation fails due to DNS not yet being visible.
 */


# ===========================================================================
# Domain Ownership Registration
# ===========================================================================

# for_each is used instead of a for expression so that each domain is tracked
# as an independent state object. This mirrors how Akamai manages domains
# individually, allowing Terraform to add, update, or remove a single domain
# without affecting the others.
resource "akamai_property_domainownership_domains" "dom_domains" {
  for_each = var.hostnames

  domains = [
    {
      domain_name      = each.key
      validation_scope = each.value.validation_scope
    }
  ]
}


# ===========================================================================
# DNS Validation Records
# ===========================================================================

resource "akamai_dns_record" "cname_validation" {
  for_each = akamai_property_domainownership_domains.dom_domains

  zone       = join(".", slice(split(".", each.key), length(split(".", each.key)) - 2, length(split(".", each.key))))
  name       = one(each.value.domains).validation_challenge.cname_record.name
  recordtype = "CNAME"
  ttl        = 3600
  target     = [one(each.value.domains).validation_challenge.cname_record.target]
}


# ===========================================================================
# Domain Ownership Validation
# ===========================================================================

# Wait for DNS propagation so Akamai's infrastructure can resolve the CNAME
# records before triggering validation.
resource "time_sleep" "wait" {
  create_duration = "300s"
  depends_on      = [akamai_dns_record.cname_validation]
}

resource "akamai_property_domainownership_validation" "jaescalo-online" {
  for_each = var.hostnames

  domains = [
    {
      domain_name       = each.key
      validation_scope  = each.value.validation_scope
      validation_method = "DNS_CNAME"
    }
  ]
}
