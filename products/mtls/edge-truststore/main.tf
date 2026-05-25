/**
 * ## mTLS Truststore CA Set Workflow Example
 * This example presents a sample workflow for creating an mTLS Truststore CA set with a self-signed certificate and activating it on `STAGING` and `PRODUCTION` environments. 
 *
 * Before applying this example, make changes to the attribute values according to your needs.
 *
 * A successful operation creates a self-signed certificate and a CA set and activates that CA set on `STAGING` and `PRODUCTION` environments.
 *
 * Activated CA Set ID can be used in the `akamai_cps_third_party_enrollment` resource to enable client mutual authentication,
 * together with property rules and the `enforce_mtls_settings` behavior in the `akamai_property_rules_builder` data source.
*/


data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "tls_private_key" "example_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "ca_certificate" {
  private_key_pem       = tls_private_key.example_key.private_key_pem
  validity_period_hours = 8760
  is_ca_certificate     = true

  allowed_uses = [
    "cert_signing",
    "key_encipherment",
    "digital_signature",
    "crl_signing"
  ]

  subject {
    common_name  = "example.com"
    organization = "Akamai"
  }
}

resource "akamai_mtlstruststore_ca_set" "test_ca_set" {
  name                = var.certificate_name
  description         = var.certificate_description
  allow_insecure_sha1 = false
  version_description = var.certificate_version_description
  certificates = [
    {
      certificate_pem = tls_self_signed_cert.ca_certificate.cert_pem
      description     = var.certificate_description
    }
  ]
}

data "akamai_mtlstruststore_ca_set" "ca_set" {
  id = akamai_mtlstruststore_ca_set.test_ca_set.id
}

resource "akamai_mtlstruststore_ca_set_activation" "ca_set_activation_staging" {
  ca_set_id = akamai_mtlstruststore_ca_set.test_ca_set.id
  version   = 1
  network   = "STAGING"
}

resource "akamai_mtlstruststore_ca_set_activation" "ca_set_activation_production" {
  ca_set_id = akamai_mtlstruststore_ca_set.test_ca_set.id
  version   = 1
  network   = "PRODUCTION"
}
