/**
 * # Akamai Client Certificate with mTLS Keystore Example
 *
 * This example presents a sample workflow for an `AKAMAI` client certificate. It creates a basic Akamai-signed client certificate, along with
 * a CP code, edge hostname, property, and rules that use the `mtls_origin_keystore` behavior to enforce the mTLS Keystore configuration.
 * Then, the property is activated on the `PRODUCTION` environment.
 *
 * To run this example:
 *
 * 1. Specify the path to your `.edgerc` file and the section header for the set of credentials to use.
 * The defaults here expect the `.edgerc` at your home directory and use the credentials under the heading of `default`.
 *
 * 2. Make changes to the attribute values according to your needs.
 *
 * 3. Open a Terminal or shell instance and initialize the provider with `terraform init`. Then, run `terraform plan` to preview the changes and `terraform apply` to apply your changes.
 *
 * A successful operation creates an Akamai-signed client certificate, CP code, edge hostname, property, rules, and property activation.
*/


data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "akamai_mtlskeystore_client_certificate_akamai" "akamai_cert" {
  certificate_name    = var.certificate_name
  contract_id         = data.akamai_contract.contract.id
  group_id            = trimprefix(data.akamai_contract.contract.group_id, "grp_")
  geography           = "CORE"
  notification_emails = var.emails
  secure_network      = "STANDARD_TLS"
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
  property_id                    = akamai_property.property.id
  contact                        = var.emails
  version                        = akamai_property.property.latest_version
  network                        = var.network
  auto_acknowledge_rule_warnings = true
}