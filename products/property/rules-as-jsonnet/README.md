# Rules as JSONNET

This example shows how you can use Jsonnet to generate the rule tree JSON. This allows you take advantage of some of the useful features of the Jsonnet templating language, such as conditions and looping. However, in order to use this, you require a few prerequisites to be met.

- Jsonnet must be installed. (You can read about this here)[https://github.com/google/jsonnet]
- You need to set the JSONNET_PATH environment variable to point to the `jsonnet` directory here. This allows the Jsonnet application to find the papi schema file which is referenced in each file found in the rules folder. A version of the v2025-01-13 ruleFormat is included in this directory, but Jsonnet rules can use any ruleFormat you wish.

The Akamai Jsonnet CLI can also be used to export properties and ruleFormats to be used in this way. (You can read about it here)[https://github.com/akamai/cli-jsonnet] 
<!-- BEGIN_TF_DOCS -->

# Property Manager: Rules as JSONNET

This example shows how you can use Jsonnet to generate the rule tree JSON. This allows you take advantage of some of the useful features of the Jsonnet templating language, such as conditions and looping. However, in order to use this, you require a few prerequisites to be met.

- Jsonnet must be installed. (You can read about this here)[https://github.com/google/jsonnet]
- You need to set the JSONNET\_PATH environment variable to point to the `jsonnet` directory here. This allows the Jsonnet application to find the papi schema file which is referenced in each file found in the rules folder. A version of the v2025-01-13 ruleFormat is included in this directory, but Jsonnet rules can use any ruleFormat you wish.

The Akamai Jsonnet CLI can also be used to export properties and ruleFormats to be used in this way. (You can read about it here)[https://github.com/akamai/cli-jsonnet]

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
  	 contract_id  = <string>
  	 default_origin  = <string>
  	 email  = <string>
  	 group_id  = <number>
  	 hostname  = <string>
  	 property_name  = <string>
  
	 # Optional variables
  	 activate_latest_on_production  = <bool> | default: false
  	 activate_latest_on_staging  = <bool> | default: true
  	 akamai_account_key  = <string> | default: ""
  	 notes  = <string> | default: "Updated by Terraform"
  	 product_id  = <string> | default: "Fresca"
  	 rule_format  = <string> | default: "v2025-01-13"
  	 sure_route_test_object  = <string> | default: "/akamai/testobject.html"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 7.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_cp_code.default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cp_code) | resource |
| [akamai_property.property](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property) | resource |
| [akamai_property_activation.production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [akamai_property_activation.staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [jsonnet_file.rules](https://registry.terraform.io/providers/alxrem/jsonnet/latest/docs/data-sources/file) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID | `string` | n/a | yes |
| <a name="input_default_origin"></a> [default\_origin](#input\_default\_origin) | Default origin server for all properties | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Notification email address for activation command | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID | `number` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | hostname for your property | `string` | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Name for your property | `string` | n/a | yes |
| <a name="input_activate_latest_on_production"></a> [activate\_latest\_on\_production](#input\_activate\_latest\_on\_production) | n/a | `bool` | `false` | no |
| <a name="input_activate_latest_on_staging"></a> [activate\_latest\_on\_staging](#input\_activate\_latest\_on\_staging) | n/a | `bool` | `true` | no |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_notes"></a> [notes](#input\_notes) | Version notes for property changes | `string` | `"Updated by Terraform"` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Product ID. Defaults to Ion Standard | `string` | `"Fresca"` | no |
| <a name="input_rule_format"></a> [rule\_format](#input\_rule\_format) | Static rule format schema. This is required when using HCL rules and must match the data source format. | `string` | `"v2025-01-13"` | no |
| <a name="input_sure_route_test_object"></a> [sure\_route\_test\_object](#input\_sure\_route\_test\_object) | Test object path for SureRoute | `string` | `"/akamai/testobject.html"` | no |

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