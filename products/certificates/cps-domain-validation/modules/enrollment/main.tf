/*
* This module creates a Domain Validation certificate enrollment at Akamai
* and sets up DNS with the validation records
*/
# Step 1 create the enrollment
resource "akamai_cps_dv_enrollment" "enrollment" {
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

output "dns_challenges" {
  value = {
    for challenge in akamai_cps_dv_enrollment.enrollment.dns_challenges : challenge.domain => {
      full_path     = challenge.full_path
      response_body = challenge.response_body
    }
  }
}

output "http_challenges" {
  value = {
    for challenge in akamai_cps_dv_enrollment.enrollment.http_challenges : challenge.domain => {
      full_path     = challenge.full_path
      response_body = challenge.response_body
    }
  }
}

output "enrollment_id" {
  value = akamai_cps_dv_enrollment.enrollment.id
}

output "hostnames" {
  value = concat([var.common_name], var.sans)
}
