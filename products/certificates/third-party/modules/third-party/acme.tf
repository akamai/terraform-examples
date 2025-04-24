# This example uses Let's Encrypt but it's valid for any CA that supports ACME
# See https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/registration

# Set your provider url here
provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.tech_contact.email
}

# Step 3 get the RSA cert
resource "acme_certificate" "rsa_certificate" {
  account_key_pem         = acme_registration.reg.account_key_pem
  certificate_request_pem = chomp(data.akamai_cps_csr.csr.csr_rsa)

  # Update this if you're not using Akamai EdgeDNS
  dns_challenge {
    provider = "edgedns"
    config = {
      AKAMAI_EDGERC_SECTION = var.config_section
    }
  }
}

# Step 4 get the ECDSA cert
resource "acme_certificate" "ecdsa_certificate" {
  account_key_pem         = acme_registration.reg.account_key_pem
  certificate_request_pem = chomp(data.akamai_cps_csr.csr.csr_ecdsa)

  # Update this if you're not using Akamai EdgeDNS
  dns_challenge {
    provider = "edgedns"
    config = {
      AKAMAI_EDGERC_SECTION = var.config_section
    }
  }

  # To ensure that we don't get any concurrent modificaton exceptions
  # where both certs might be trying to update DNS at the same time
  depends_on = [
    acme_certificate.rsa_certificate
  ]
}
