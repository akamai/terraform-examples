/**
 * # mTLS Keystore with Third-Party Client Certificate Example
 * 
 * This example presents a sample workflow for a `THIRD-PARTY` client certificate. It creates a basic third-party client certificate using a self-signed certificate, along with
 * a CP code, edge hostname, property, and rules that use the `mtls_origin_keystore` behavior to enforce the mTLS Keystore configuration.
 * Then, the property is activated on the `PRODUCTION` environment.
 *
 * To run this example:
 *
 * 1. Specify the path to your `.edgerc` file and the section header for the set of credentials to use.
 *
 * The defaults here expect the `.edgerc` at your home directory and use the credentials under the heading of `default`.
 *
 * 2. Make changes to the attribute values according to your needs.
 *
 * 3. Open a Terminal or shell instance and initialize the provider with `terraform init`. Then, run `terraform plan` to preview the changes and `terraform apply` to apply your changes.
 *
 * A successful operation creates a third-party client certificate, CP code, edge hostname, property, rules, and property activation.
*/

data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "akamai_mtlskeystore_client_certificate_third_party" "third_party_cert" {
  certificate_name    = var.certificate_name
  contract_id         = data.akamai_contract.contract.id
  geography           = "CORE"
  group_id            = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  notification_emails = var.emails
  secure_network      = "STANDARD_TLS"
  versions = {
    version_1 = {},
  }
}

resource "akamai_mtlskeystore_client_certificate_upload" "upload" {
  client_certificate_id = akamai_mtlskeystore_client_certificate_third_party.third_party_cert.certificate_id
  version_number        = akamai_mtlskeystore_client_certificate_third_party.third_party_cert.versions.version_1.version
  signed_certificate    = tls_locally_signed_cert.signed_cert.cert_pem
  wait_for_deployment   = true
}

data "akamai_mtlskeystore_client_certificate" "third_party_ds" {
  certificate_id = akamai_mtlskeystore_client_certificate_upload.upload.client_certificate_id
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "cert" {
  depends_on            = [tls_private_key.key]
  private_key_pem       = tls_private_key.key.private_key_pem
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

resource "tls_locally_signed_cert" "signed_cert" {
  depends_on            = [tls_private_key.key]
  ca_private_key_pem    = tls_private_key.key.private_key_pem
  cert_request_pem      = akamai_mtlskeystore_client_certificate_third_party.third_party_cert.versions.version_1.csr_block.csr
  ca_cert_pem           = tls_self_signed_cert.cert.cert_pem
  validity_period_hours = 8760
  allowed_uses = [
    "cert_signing",
    "key_encipherment",
    "digital_signature",
    "crl_signing"
  ]
}

resource "akamai_property" "property" {
  name        = var.property_name
  contract_id = data.akamai_contract.contract.id
  group_id    = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  product_id  = var.product_id
  hostnames {
    cname_from             = var.hostname
    cname_to               = var.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  rule_format = data.akamai_property_rules_builder.rule_default.rule_format
  rules       = data.akamai_property_rules_builder.rule_default.json
}

resource "akamai_property_activation" "activation_production" {
  depends_on                     = [akamai_mtlskeystore_client_certificate_upload.upload]
  property_id                    = akamai_property.property.id
  contact                        = var.emails
  version                        = akamai_property.property.latest_version
  network                        = var.network
  auto_acknowledge_rule_warnings = true
}