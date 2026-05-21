/*
* # Create Domain Validation Enrollment
* This module creates a Domain Validation certificate enrollment at Akamai
*/
locals {
  secure_network = (var.enhanced_tls == true) ? "enhanced-tls" : "standard-tls"
}

resource "akamai_cps_dv_enrollment" "certificate" {
  contract_id                           = var.contract_id
  acknowledge_pre_verification_warnings = true
  common_name                           = var.hostname
  sans                                  = [var.hostname]
  secure_network                        = local.secure_network
  sni_only                              = true
  admin_contact {
    first_name       = "Akamai"
    last_name        = "Contact"
    phone            = "44800800800"
    email            = "x1x2@example.net"
    address_line_one = "150 Broadway"
    city             = "Cambridge"
    country_code     = "US"
    organization     = "Akamai"
    postal_code      = "02142"
    region           = "MA"
    title            = "Administrator"
  }
  tech_contact {
    first_name       = "Technical"
    last_name        = "Contact"
    phone            = "44800800800"
    email            = "x3x4@akamai.com"
    address_line_one = "150 Broadway"
    city             = "Cambridge"
    country_code     = "US"
    organization     = "Akamai"
    postal_code      = "02142"
    region           = "MA"
    title            = "Administrator"
  }
  csr {
    country_code        = "US"
    city                = "Cambridge"
    organization        = "Akamai"
    organizational_unit = "Dev"
    state               = "MA"
  }
  network_configuration {
    geography     = "core"
    ocsp_stapling = "on"
    quic_enabled  = true
  }
  signature_algorithm = "SHA-256"
  organization {
    name             = "Akamai"
    phone            = "123123123"
    address_line_one = "150 Broadway"
    city             = "Cambridge"
    country_code     = "US"
    postal_code      = "02142"
    region           = "MA"
  }
}
