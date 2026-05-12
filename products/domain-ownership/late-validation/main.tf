/**
* # Domain Ownership Manager Late Validation Example
*
* This module manages an Akamai property with multiple hostnames and automates the
* DNS-based Domain Ownership Validation required for **DEFAULT DV (Secure by Default)**
* certificate provisioning.
*
* ## Workflow
*
* Everything can be applied in a **single `terraform apply`** run. Terraform's
* dependency graph ensures the correct order of operations:
*
* 1. `akamai_property` is created and the `cert_status` ACME challenge data is
*    populated automatically by the Akamai provider.
* 2. `akamai_dns_record` CNAME records are created for each `DEFAULT` hostname
*    using the challenge values from `cert_status`.
* 3. `akamai_property_domainownership_late_validation` signals Akamai that the
*    DNS records are in place, gating activation until validation passes.
* 4. `akamai_property_activation` proceeds once validation is complete.
*
* ## ⚠️ Domain Ownership Validation
*
* For any hostname using `cert_provisioning_type = "DEFAULT"`, Akamai requires a
* DNS CNAME record to prove domain ownership before issuing the certificate.
* The required records are derived from the `cert_status` attribute on the
* `akamai_property` resource and created automatically via `akamai_dns_record`.
*
* The `akamai_property_domainownership_late_validation` resource **must complete
* successfully before activation**, as it blocks activation until all DEFAULT
* hostnames are validated. It depends on the DNS records being resolvable by
* Akamai's validation infrastructure.
*
*/

# ===========================================================================
# Property Resource
# ===========================================================================

resource "akamai_property" "this" {
  name        = var.property_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
  dynamic "hostnames" {
    for_each = var.hostnames
    content {
      cname_from             = hostnames.key
      cname_to               = "${hostnames.key}.edgekey.net"
      cert_provisioning_type = hostnames.value.cert_provisioning_type
    }
  }
}

# ===========================================================================
# CA Certificate Validation
# ===========================================================================

locals {
  # Hostnames using DEFAULT (Secure by Default) certificate - derived from var.hostnames for plan-time for_each
  ca_validation_hostnames = toset([
    for hostname, config in var.hostnames :
    hostname if config.cert_provisioning_type == "DEFAULT"
  ])

  # ACME challenge data for DEFAULT cert hostnames, and compute top-level domain for zone
  # cert_status is only known after apply, so still read from the property resource
  ca_validation_records = {
    for entry in akamai_property.this.hostnames :
    entry.cname_from => {
      challenge_name   = try(entry.cert_status[0].hostname, null)
      challenge_target = try(entry.cert_status[0].target, null)
      zone             = join(".", slice(split(".", entry.cname_from), length(split(".", entry.cname_from)) - 2, length(split(".", entry.cname_from))))
    }
    if try(entry.cert_status[0].hostname, null) != null && entry.cert_provisioning_type == "DEFAULT"
  }
}

resource "akamai_dns_record" "cert_validation" {
  for_each = var.enable_cert_validation ? local.ca_validation_hostnames : toset([])

  zone       = local.ca_validation_records[each.value].zone
  name       = "_acme-challenge.${each.value}"
  recordtype = "CNAME"
  ttl        = 3600
  target     = [local.ca_validation_records[each.value].challenge_target]
}

# Wait for Akamai to see the ACME CNAME records and validate all hostnames
# before attempting activation.
resource "akamai_property_domainownership_late_validation" "this" {
  count = var.enable_cert_validation ? 1 : 0

  contract_id       = var.contract_id
  group_id          = var.group_id
  property_id       = akamai_property.this.id
  version           = akamai_property.this.latest_version
  validation_method = "DNS_CNAME"

  depends_on = [akamai_dns_record.cert_validation]
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "activation" {
  property_id                    = akamai_property.this.id
  contact                        = var.contact
  version                        = akamai_property.this.latest_version
  network                        = var.activation_network
  auto_acknowledge_rule_warnings = true
}
