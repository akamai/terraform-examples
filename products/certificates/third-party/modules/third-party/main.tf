/*
* # Third Party Certificate Enrollment 
*
* This module creates a third party certificate enrollment at Akamai, passes
* the CSR to your ACME provider, validates, and passes the signed cert back
* to Akamai for deployment onto the platform. Note, this module should be
* updated to configure acme.tf according to your provider settings. This is
* not a runtime configurable that's defined by input variables
*/

# Step 1 create the enrollment
resource "akamai_cps_third_party_enrollment" "enrollment" {
  common_name                           = var.common_name
  allow_duplicate_common_name           = false
  sans                                  = var.sans
  secure_network                        = var.secure_network
  sni_only                              = true
  acknowledge_pre_verification_warnings = true
  admin_contact {
    first_name       = var.admin_contact.first_name
    last_name        = var.admin_contact.last_name
    organization     = var.admin_contact.organization
    email            = var.admin_contact.email
    phone            = var.admin_contact.phone
    address_line_one = var.admin_contact.address_line_one
    address_line_two = var.admin_contact.address_line_two
    city             = var.admin_contact.city
    region           = var.admin_contact.region
    postal_code      = var.admin_contact.postal_code
    country_code     = var.admin_contact.country_code
  }
  certificate_chain_type = "default"
  csr {
    country_code        = var.organization.country_code
    city                = var.organization.city
    organization        = var.organization.organization
    organizational_unit = var.organization.unit
    state               = var.organization.region
  }
  network_configuration {
    clone_dns_names         = true
    disallowed_tls_versions = ["TLSv1", "TLSv1_1"]
    geography               = "core"
    must_have_ciphers       = "ak-akamai-2018q3"
    ocsp_stapling           = "on"
    preferred_ciphers       = "ak-akamai-2018q3"
    quic_enabled            = true
  }
  signature_algorithm = "SHA-256"
  tech_contact {
    first_name       = var.tech_contact.first_name
    last_name        = var.tech_contact.last_name
    organization     = var.tech_contact.organization
    email            = var.tech_contact.email
    phone            = var.tech_contact.phone
    address_line_one = var.tech_contact.address_line_one
    city             = var.tech_contact.city
    region           = var.tech_contact.region
    postal_code      = var.tech_contact.postal_code
    country_code     = var.tech_contact.country_code
  }
  organization {
    name             = var.organization.organization
    phone            = var.organization.phone
    address_line_one = var.organization.address_line_one
    address_line_two = var.organization.address_line_two
    city             = var.organization.city
    region           = var.organization.region
    postal_code      = var.organization.postal_code
    country_code     = var.organization.country_code
  }
  contract_id = var.contract_id
}

# Step 2 get the CSR
data "akamai_cps_csr" "csr" {
  enrollment_id = akamai_cps_third_party_enrollment.enrollment.id
}

# Step 6 upload both RSA and ECDSA certs to Akamai
resource "akamai_cps_upload_certificate" "upload_cert" {
  enrollment_id                          = akamai_cps_third_party_enrollment.enrollment.id
  certificate_rsa_pem                    = acme_certificate.rsa_certificate.certificate_pem
  trust_chain_rsa_pem                    = acme_certificate.rsa_certificate.issuer_pem
  certificate_ecdsa_pem                  = acme_certificate.ecdsa_certificate.certificate_pem
  trust_chain_ecdsa_pem                  = acme_certificate.ecdsa_certificate.issuer_pem
  acknowledge_post_verification_warnings = true
  acknowledge_change_management          = true
  wait_for_deployment                    = true
  timeouts {
    default = "1h"
  }
}
