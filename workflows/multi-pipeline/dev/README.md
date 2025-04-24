<!-- BEGIN_TF_DOCS -->

# Multi Pipeline "dev" Example

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 akamai_access_token  = <any>
  	 akamai_account_key  = <any>
  	 akamai_client_secret  = <any>
  	 akamai_client_token  = <any>
  	 akamai_host  = <any>
  	 contract_id  = <string>
  	 default_origin  = <string>
  	 email  = <string>
  	 group_id  = <string>
  	 hostname  = <string>
  	 project_name  = <string>
  
	 # Optional variables
  	 edgerc  = <string> | default: "~/.edgerc"
  	 enable_client_rep  = <bool> | default: true
  	 enable_siem  = <bool> | default: true
  	 enable_slow_post  = <bool> | default: true
  	 enhanced_tls  = <bool> | default: false
  	 geo_block_list  = <list(any)> | default: []
  	 ip_block_list  = <list(any)> | default: []
  	 ip_block_list_exceptions  = <list(any)> | default: []
  	 notes  = <string> | default: "Managed by Terraform"
  	 pragma_exceptions  = <list(any)> | default: []
  	 product_id  = <string> | default: "Fresca"
  	 rate_bypass_list  = <list(any)> | default: []
  	 rule_format  = <string> | default: "latest"
  	 section  = <string> | default: "default"
  	 security_bypass_list  = <list(any)> | default: []
  	 security_config_description  = <string> | default: "Configured by Terraform"
  	 sure_route_test_object  = <string> | default: "/akamai/testobject.html"
  	 td_region  = <string> | default: "CH2"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 7.0 |

## Resources

No resources.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aap"></a> [aap](#module\_aap) | ../../../products/aapasm | n/a |
| <a name="module_certificate"></a> [certificate](#module\_certificate) | ../../../products/certificate/dv | n/a |
| <a name="module_network-lists"></a> [network-lists](#module\_network-lists) | ../../../products/network-lists | n/a |
| <a name="module_property"></a> [property](#module\_property) | ../../../products/property/rules-as-hcl | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | n/a | `any` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | n/a | `any` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Environment variables (TF\_VAR\_*) | `any` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | n/a | `any` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | n/a | `any` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID for property/config creation | `string` | n/a | yes |
| <a name="input_default_origin"></a> [default\_origin](#input\_default\_origin) | Default origin server for all properties | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Email address used for activations | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID for property/config creation | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname to include in configs/properties | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the overall project. Used to name various resources. Should only contain letters, numbers and underscores | `string` | n/a | yes |
| <a name="input_edgerc"></a> [edgerc](#input\_edgerc) | EdgeRC file location | `string` | `"~/.edgerc"` | no |
| <a name="input_enable_client_rep"></a> [enable\_client\_rep](#input\_enable\_client\_rep) | On/Off option for Client Reputation feature | `bool` | `true` | no |
| <a name="input_enable_siem"></a> [enable\_siem](#input\_enable\_siem) | On/Off option for SIEM feature | `bool` | `true` | no |
| <a name="input_enable_slow_post"></a> [enable\_slow\_post](#input\_enable\_slow\_post) | On/Off option for Slow Post feature | `bool` | `true` | no |
| <a name="input_enhanced_tls"></a> [enhanced\_tls](#input\_enhanced\_tls) | Boolean to switch between Enhanced and Standard TLS modes | `bool` | `false` | no |
| <a name="input_geo_block_list"></a> [geo\_block\_list](#input\_geo\_block\_list) | Geo Block List Geos | `list(any)` | `[]` | no |
| <a name="input_ip_block_list"></a> [ip\_block\_list](#input\_ip\_block\_list) | IP Block List IPs | `list(any)` | `[]` | no |
| <a name="input_ip_block_list_exceptions"></a> [ip\_block\_list\_exceptions](#input\_ip\_block\_list\_exceptions) | IP Block List Exceptions IPs | `list(any)` | `[]` | no |
| <a name="input_notes"></a> [notes](#input\_notes) | Execution notes, used to update certain elements | `string` | `"Managed by Terraform"` | no |
| <a name="input_pragma_exceptions"></a> [pragma\_exceptions](#input\_pragma\_exceptions) | Pragma Removal Exceptions IPs | `list(any)` | `[]` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Property Manager product | `string` | `"Fresca"` | no |
| <a name="input_rate_bypass_list"></a> [rate\_bypass\_list](#input\_rate\_bypass\_list) | Rate Control Bypass List IPs | `list(any)` | `[]` | no |
| <a name="input_rule_format"></a> [rule\_format](#input\_rule\_format) | Property rule format | `string` | `"latest"` | no |
| <a name="input_section"></a> [section](#input\_section) | EdgeRC section | `string` | `"default"` | no |
| <a name="input_security_bypass_list"></a> [security\_bypass\_list](#input\_security\_bypass\_list) | Security Bypass List IPs | `list(any)` | `[]` | no |
| <a name="input_security_config_description"></a> [security\_config\_description](#input\_security\_config\_description) | Description used in AAP configuration | `string` | `"Configured by Terraform"` | no |
| <a name="input_sure_route_test_object"></a> [sure\_route\_test\_object](#input\_sure\_route\_test\_object) | Test object path for SureRoute | `string` | `"/akamai/testobject.html"` | no |
| <a name="input_td_region"></a> [td\_region](#input\_td\_region) | Region (map) for Tiered Distribution behaviour. Only applies if network is Standard TLS. Options are: CH2, CHAPAC, CHEU2, CHEUS2, CHWUS2, CHCUS2, CHAUS | `string` | `"CH2"` | no |

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