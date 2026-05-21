locals {
  contact_details = {
    first_name       = "Alice"
    last_name        = "Smith"
    organization     = "Example Ltd"
    unit             = "Tech Dept"
    email            = "alice@example.com"
    phone            = "+447700900123"
    address_line_one = "123 Test Street"
    address_line_two = "Suite 456"
    city             = "Testville"
    region           = "Testshire"
    postal_code      = "TST123"
    country_code     = "GB"
  }
  contract_id    = var.contract_id
  common_name    = var.hostname
  sans           = [var.hostname]
  secure_network = (var.enhanced_tls == true) ? "enhanced-tls" : "standard-tls"
}

module "enrollment" {
  source         = "../modules/enrollment"
  contract_id    = local.contract_id
  common_name    = local.common_name
  sans           = local.sans
  secure_network = local.secure_network
  admin_contact  = local.contact_details
  tech_contact   = merge(local.contact_details, { email = "noreply@akamai.com" }) # Override the tech contact
  organization   = local.contact_details
}

module "dns" {
  source     = "../modules/dns"
  zone       = var.dns_zone
  challenges = module.enrollment.dns_challenges
  hostnames  = module.enrollment.hostnames
}

module "validation" {
  source        = "../modules/validation"
  enrollment_id = module.enrollment.enrollment_id
  hostnames     = module.dns.hostnames
}

output "dns_challenges" {
  value = module.enrollment.dns_challenges
}
