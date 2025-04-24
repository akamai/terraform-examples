/*
* This modules shows a use-case where a customer can use hostname buckets and default
* certificates to manage thousands of hostnames on a delivery property. It will return
* a map of challenges for validating the certificate for each hostname. The map key is
* the acme challenge "hostname" and the value is the "target".
*/

resource "akamai_property" "bucket" {
  name                = var.property_name
  contract_id         = var.contract_id
  group_id            = var.group_id
  product_id          = var.product_id
  use_hostname_bucket = true
  rule_format         = data.akamai_property_rules_builder.bucket_rule_default.rule_format
  rules               = data.akamai_property_rules_builder.bucket_rule_default.json
}

resource "akamai_edge_hostname" "edgehostname_edgesuite_net" {
  contract_id   = var.contract_id
  group_id      = var.group_id
  product_id    = var.product_id
  ip_behavior   = "IPV6_COMPLIANCE"
  edge_hostname = "${var.property_name}.edgesuite.net"
}

resource "akamai_property_activation" "bucket-staging" {
  property_id                    = akamai_property.bucket.id
  contact                        = var.contacts
  version                        = akamai_property.bucket.latest_version
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = true
}

resource "akamai_property_activation" "bucket-production" {
  property_id                    = akamai_property.bucket.id
  contact                        = var.contacts
  version                        = akamai_property.bucket.latest_version
  network                        = "PRODUCTION"
  auto_acknowledge_rule_warnings = true
  dynamic "compliance_record" {
    for_each = var.compliance_record != null ? [1] : []
    content {
      dynamic "noncompliance_reason_none" {
        for_each = var.compliance_record.reason == "none" ? [1] : []
        content {
          customer_email   = var.compliance_record.customer_email
          peer_reviewed_by = var.compliance_record.peer_reviewed_by
          unit_tested      = var.compliance_record.unit_tested
        }
      }

      dynamic "noncompliance_reason_no_production_traffic" {
        for_each = var.compliance_record.reason == "no_production_traffic" ? [1] : []
        content {
        }
      }
    }
  }
}

resource "akamai_property_hostname_bucket" "bucket-hostname-bucket-staging" {
  property_id   = akamai_property_activation.bucket-staging.property_id
  contract_id   = var.contract_id
  group_id      = var.group_id
  network       = "STAGING"
  note          = var.notes
  notify_emails = var.contacts
  hostnames = {
    for hostname in var.hostnames :
    hostname => {
      cert_provisioning_type = "DEFAULT"
      edge_hostname_id       = akamai_edge_hostname.edgehostname_edgesuite_net.id
    }
  }
}

resource "akamai_property_hostname_bucket" "bucket-hostname-bucket-production" {
  property_id   = akamai_property_activation.bucket-production.property_id
  contract_id   = var.contract_id
  group_id      = var.group_id
  network       = "PRODUCTION"
  note          = var.notes
  notify_emails = var.contacts
  hostnames = {
    for hostname in var.hostnames :
    hostname => {
      cert_provisioning_type = "DEFAULT"
      edge_hostname_id       = akamai_edge_hostname.edgehostname_edgesuite_net.id
    }
  }
}

# The hostnames that were passed to us when we created these properties
output "hostnames" {
  value = var.hostnames
}

data "akamai_property_hostnames" "hostnames" {
  contract_id = var.contract_id
  group_id    = var.group_id
  property_id = akamai_property.bucket.id

  # We have to look at the property but not until we've attached the bucket hostnames
  depends_on = [
    akamai_property_hostname_bucket.bucket-hostname-bucket-staging,
    akamai_property_hostname_bucket.bucket-hostname-bucket-production
  ]
}

# A list of DNS CNAME domain validation challenges where each entry is an object that contains "hostname" and "target"
output "challenges" {
  value = {
    for entry in data.akamai_property_hostnames.hostnames.hostname_bucket :
    entry.cert_status[0].hostname => entry.cert_status[0].target
  }
}
