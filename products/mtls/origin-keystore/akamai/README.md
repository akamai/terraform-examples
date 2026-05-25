<!-- BEGIN_TF_DOCS -->

# Akamai Client Certificate with mTLS Keystore Example

This example presents a sample workflow for an `AKAMAI` client certificate. It creates a basic Akamai-signed client certificate, along with
a CP code, edge hostname, property, and rules that use the `mtls_origin_keystore` behavior to enforce the mTLS Keystore configuration.
Then, the property is activated on the `PRODUCTION` environment.

To run this example:

1. Specify the path to your `.edgerc` file and the section header for the set of credentials to use.
The defaults here expect the `.edgerc` at your home directory and use the credentials under the heading of `default`.

2. Make changes to the attribute values according to your needs.

3. Open a Terminal or shell instance and initialize the provider with `terraform init`. Then, run `terraform plan` to preview the changes and `terraform apply` to apply your changes.

A successful operation creates an Akamai-signed client certificate, CP code, edge hostname, property, rules, and property activation.

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
  	 certificate_name  = <string>
  	 edge_hostname  = <string>
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

## Resources

| Name | Type |
|------|------|
| [akamai_mtlskeystore_client_certificate_akamai.akamai_cert](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/mtlskeystore_client_certificate_akamai) | resource |
| [akamai_property.property](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property) | resource |
| [akamai_property_activation.activation_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [akamai_contract.contract](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/contract) | data source |
| [akamai_property_rules_builder.keystore](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.rule_default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_certificate_name"></a> [certificate\_name](#input\_certificate\_name) | The name of the client certificate to be created in the Akamai mTLS keystore. | `string` | n/a | yes |
| <a name="input_edge_hostname"></a> [edge\_hostname](#input\_edge\_hostname) | The hostname for the Akamai property. Include the edgekey.net or edgesuite.net suffix. | `string` | n/a | yes |
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