# Examples

This directory contains a basic Cloud Certificate Manager (CCM) workflow.
The resources used in these examples are available to all users. 
However, if any of the write examples do not work for you, contact your account administrator about your privilege level.

## Run

To run the files, follow the general steps below.
Refer to each example file for more details.

1. Specify the location of your `.edgerc` file and the section header for the set of credentials you want to use. The default section is `default`.
2. Make any necessary changes to the attribute values, replacing placeholder data with your valid data to match your account privileges or requirements.
3. Open a terminal or shell and initialize the provider by running `terraform init`.
4. Run `terraform plan` to preview the changes and `terraform apply` to apply your changes.

## Sample files

Each example file contains calls to the Cloud Certificate Manager (CCM) subprovider and Property API (PAPI) subprovider endpoints. See the [PAPI Terraform integration](https://techdocs.akamai.com/terraform/docs/set-up-property-provisioning) and [CCM Terraform integration](https://techdocs.akamai.com/terraform/docs/ccm-integration-guide) documentation for complete guides.

| Asset                                   | Description                                                                                                                                                                                                                                                                                                                                 |
|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Cloud Certificate](./cloudcertificate.tf)               | Creates a third-party cloud certificate and uploads a self-signed certificate.                            |
| [PAPI](./papi.tf)                            | Creates a property with a hostname pointing to the cloud certificate and activates the configuration on the `STAGING` and `PRODUCTION` environments.      |
| [Rules](./property-snippets/main.json)                            | Contains sample rules for the property.      |

<!-- BEGIN_TF_DOCS -->

# Cloud Certificates

This example presents a sample CCM workflow that includes creating a self-signed cloud certificate and uploading it.
Optionally, provide a PEM-encoded trust chain when uploading the signed certificate.

Before applying this example, make changes to the attribute values according to your needs.

This workflow generates a self-signed certificate, provisions a cloud certificate, and uploads the signed certificate.

Use the certificate ID from the `akamai_cloudcertificates_upload_signed_certificate` resource to bind the signed certificate with the hostname in the `akamai_property` resource.

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
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | >= 9.2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_cloudcertificates_certificate.test](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudcertificates_certificate) | resource |
| [akamai_cloudcertificates_upload_signed_certificate.upload](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudcertificates_upload_signed_certificate) | resource |
| [akamai_property.test](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property) | resource |
| [akamai_property_activation.test-production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [akamai_property_activation.test-staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [tls_locally_signed_cert.signed_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |
| [akamai_property_rules_builder.rule_default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_template.rules](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_template) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |

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