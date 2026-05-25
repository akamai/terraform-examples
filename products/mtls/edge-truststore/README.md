# Akamai mTLS Truststore Example

This directory contains a basic mTLS Truststore workflow, including setting up CPS and PAPI integrations. The resources used in these examples are available to all users. 
However, if any of the write examples do not work for you, contact your account administrator about your privilege level.

## Run

To run the files, follow the general steps below.
Refer to each example file for more details.

1. Specify the location of your `.edgerc` file and the section header for the set of credentials you want to use. The default section is `default`.
2. Make any necessary changes to the attribute values, replacing placeholder data with your valid data to match your account privileges or requirements.
3. Open a terminal or shell and initialize the provider by running `terraform init`.
4. Run `terraform plan` to preview the changes and `terraform apply` to apply your changes.

## Sample files

Each example file contains calls to the Certificate Provisioning System (CPS) subprovider, Property API (PAPI) subprovider, and mTLS Truststore subprovider endpoints. See the [CPS Terraform integration](https://techdocs.akamai.com/terraform/docs/cps-integration-guide), [PAPI Terraform integration](https://techdocs.akamai.com/terraform/docs/set-up-property-provisioning), and [mTLS Truststore Terraform integration](https://techdocs.akamai.com/terraform/docs/manage-certificate-authority-sets) documentation for complete guides.

| Asset                                   | Description                                                                                                                                                                                                                                                                                                                                 |
|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [mTLS Truststore](./main.tf)               | Creates a self-signed certificate used to create and activate a CA set on `STAGING` and `PRODUCTION` environments.                                                                                                                                                                                                                              |
| [CPS](./cps.tf)                            | Creates a third-party enrollment with `client_mutual_authentication` enabled, referencing the activated CA set and fetching its CSRs. After self-signing the selected certificate signing request (CSR), it uses the `akamai_cps_upload_certificate` resource to deploy the signed certificate.      |
| [Rules](./rules.tf)                        | Creates property rules with the `enforce_mtls_settings` behavior, referring to the activated CA set.                                                                                                                                                                                                                                        |
| [PAPI](./papi.tf)                          | Creates an edge hostname, CP code, and property, and activates that property on `STAGING` and `PRODUCTION` environments, enforcing the mTLS Truststore configuration.                                                                                                                                                                                                    |

<!-- BEGIN_TF_DOCS -->

## mTLS Truststore CA Set Workflow Example
This example presents a sample workflow for creating an mTLS Truststore CA set with a self-signed certificate and activating it on `STAGING` and `PRODUCTION` environments.

Before applying this example, make changes to the attribute values according to your needs.

A successful operation creates a self-signed certificate and a CA set and activates that CA set on `STAGING` and `PRODUCTION` environments.

Activated CA Set ID can be used in the `akamai_cps_third_party_enrollment` resource to enable client mutual authentication,
together with property rules and the `enforce_mtls_settings` behavior in the `akamai_property_rules_builder` data source.

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 akamai_access_token  = <string>
  	 akamai_client_secret  = <string>
  	 akamai_client_token  = <string>
  	 akamai_host  = <string>
  	 certificate_description  = <string>
  	 certificate_name  = <string>
  	 certificate_version_description  = <string>
  	 common_name  = <string>
  	 emails  = <list(string)>
  	 group_name  = <string>
  	 hostname  = <string>
  	 property_name  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 network  = <string> | default: "STAGING"
  	 product_id  = <string> | default: "prd_Fresca"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 10.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_cps_third_party_enrollment.enrollment](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cps_third_party_enrollment) | resource |
| [akamai_cps_upload_certificate.upload_cert](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cps_upload_certificate) | resource |
| [akamai_edge_hostname.aka_edgehost](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/edge_hostname) | resource |
| [akamai_mtlstruststore_ca_set.test_ca_set](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/mtlstruststore_ca_set) | resource |
| [akamai_mtlstruststore_ca_set_activation.ca_set_activation_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/mtlstruststore_ca_set_activation) | resource |
| [akamai_mtlstruststore_ca_set_activation.ca_set_activation_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/mtlstruststore_ca_set_activation) | resource |
| [akamai_property.property](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property) | resource |
| [tls_locally_signed_cert.signed_certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.cps_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_private_key.example_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.ca_certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |
| [tls_self_signed_cert.cps_certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |
| [akamai_contract.contract](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/contract) | data source |
| [akamai_cps_csr.cps_csr](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/cps_csr) | data source |
| [akamai_mtlstruststore_ca_set.ca_set](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/mtlstruststore_ca_set) | data source |
| [akamai_property_rules_builder.full_mtls_workflow_rule_default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.full_mtls_workflow_rule_m_tls_settings_enforcement_base](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.full_mtls_workflow_rule_m_tls_settings_enforcement_custom](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_certificate_description"></a> [certificate\_description](#input\_certificate\_description) | The description of the client certificate to be created in the Akamai mTLS Truststore. | `string` | n/a | yes |
| <a name="input_certificate_name"></a> [certificate\_name](#input\_certificate\_name) | The name of the client certificate to be created in the Akamai mTLS Truststore. | `string` | n/a | yes |
| <a name="input_certificate_version_description"></a> [certificate\_version\_description](#input\_certificate\_version\_description) | The version description of the client certificate to be created in the Akamai mTLS Truststore. | `string` | n/a | yes |
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | The name of the client certificate to be created in CPS. | `string` | n/a | yes |
| <a name="input_emails"></a> [emails](#input\_emails) | A list of email addresses to notify when changes are made to the GTM domain. | `list(string)` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | The name of the Akamai group. | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname for the Akamai property. | `string` | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | The name of the Akamai property. | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_network"></a> [network](#input\_network) | The network to which the property should be activated. Valid values are STAGING or PRODUCTION. | `string` | `"STAGING"` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | n/a | `string` | `"prd_Fresca"` | no |

## Outputs

No outputs.

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->