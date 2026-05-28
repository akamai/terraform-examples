/**
 * This example presents a sample workflow for configuring a property that uses a Cloud Certificate Manager (CCM) integration.
 *
 * Before applying this example, make changes to the attribute values according to your needs.
 *
 * A successful operation creates a property with a hostname bound to the cloud certificate, and activates that property on the `STAGING` and `PRODUCTION` environments.
*/

resource "akamai_property" "test" {
  name        = var.property_name
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_contract.contract.group_id
  product_id  = "Fresca"
  hostnames {
    cname_from             = var.hostname
    cname_to               = var.edge_hostname
    cert_provisioning_type = "CCM"
    ccm_certificates {
      rsa_cert_id = akamai_cloudcertificates_upload_signed_certificate.upload.certificate_id
    }
  }
  rule_format = data.akamai_property_rules_builder.rule_default.rule_format
  rules       = data.akamai_property_rules_builder.rule_default.json
}

resource "akamai_property_activation" "test-staging" {
  property_id                    = akamai_property.test.id
  contact                        = var.contacts
  version                        = akamai_property.test.latest_version
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = false
}

resource "akamai_property_activation" "test-production" {
  property_id                    = akamai_property.test.id
  contact                        = var.contacts
  version                        = akamai_property.test.latest_version
  network                        = "PRODUCTION"
  auto_acknowledge_rule_warnings = false
}