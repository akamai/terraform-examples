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
  source        = "../modules/third-party"
  contract_id   = "AK12345"
  common_name   = "www.example.org"
  sans          = ["www.example.com", "www.example.net"]
  tech_contact  = local.contact_details
  admin_contact = local.contact_details
  organization  = local.contact_details
}

