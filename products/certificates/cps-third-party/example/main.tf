locals {
  contact_details = {
    first_name       = "Alice"
    last_name        = "Smith"
    organization     = "Example Ltd"
    unit             = "Tech Dept"
    email            = "alice.smith@example.org"
    phone            = "+447700900123"
    address_line_one = "123 Test Street"
    address_line_two = "Suite 456"
    city             = "Testville"
    region           = "Testshire"
    postal_code      = "TST123"
    country_code     = "GB"
  }
}

module "example" {
  source         = "../modules/third-party"
  config_section = var.config_section
  contract_id    = var.contract_id
  common_name    = var.common_name
  sans           = var.sans
  secure_network = var.secure_network
  tech_contact   = merge(local.contact_details, { email = "noreply@akamai.com" }) # Override the tech contact
  admin_contact  = local.contact_details
  organization   = local.contact_details
}

