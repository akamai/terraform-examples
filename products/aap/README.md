<!-- BEGIN_TF_DOCS -->

# App & API Protector (AAP)

This module will create an AAP config (the updated equivalent of Web Application Protector) with input variables to control the following features:

- SIEM
- Client Reputation
- Slow Post Detection

> Note: This module should only be used if you have the simple "App & API Protector" product on contract, rather than the more feature-rich "App & API Protector with Advanced Security Module" (which most customers have). If you are uncertain which one you have, you probably want AAPASM.

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
  	 config_description  = <string>
  	 config_name  = <string>
  	 contract_id  = <string>
  	 email  = <string>
  	 geo_block_list_id  = <string>
  	 group_id  = <string>
  	 hostname  = <string>
  	 ip_block_list_exceptions_id  = <string>
  	 ip_block_list_id  = <string>
  	 notes  = <string>
  	 pragma_exceptions_id  = <string>
  	 rate_bypass_list_id  = <string>
  	 security_bypass_list_id  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 enable_client_rep  = <bool> | default: true
  	 enable_siem  = <bool> | default: true
  	 enable_slow_post  = <bool> | default: true
  	 policy_name  = <string> | default: "default"
  	 policy_prefix  = <string> | default: "DEF1"
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
| <a name="module_activation"></a> [activation](#module\_activation) | ./modules/activation | n/a |
| <a name="module_config"></a> [config](#module\_config) | ./modules/config | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_config_description"></a> [config\_description](#input\_config\_description) | n/a | `string` | n/a | yes |
| <a name="input_config_name"></a> [config\_name](#input\_config\_name) | n/a | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | n/a | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | n/a | `string` | n/a | yes |
| <a name="input_geo_block_list_id"></a> [geo\_block\_list\_id](#input\_geo\_block\_list\_id) | Geo Block List Geos Network List ID | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | n/a | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname to include in configs/properties | `string` | n/a | yes |
| <a name="input_ip_block_list_exceptions_id"></a> [ip\_block\_list\_exceptions\_id](#input\_ip\_block\_list\_exceptions\_id) | IP Block List Exceptions IPs Network List ID | `string` | n/a | yes |
| <a name="input_ip_block_list_id"></a> [ip\_block\_list\_id](#input\_ip\_block\_list\_id) | IP Block List IPs Network List ID | `string` | n/a | yes |
| <a name="input_notes"></a> [notes](#input\_notes) | Execution notes, used to update certain elements | `string` | n/a | yes |
| <a name="input_pragma_exceptions_id"></a> [pragma\_exceptions\_id](#input\_pragma\_exceptions\_id) | Pragma Removal Exceptions IPs Network List ID | `string` | n/a | yes |
| <a name="input_rate_bypass_list_id"></a> [rate\_bypass\_list\_id](#input\_rate\_bypass\_list\_id) | Rate Control Bypass List IPs Network List ID | `string` | n/a | yes |
| <a name="input_security_bypass_list_id"></a> [security\_bypass\_list\_id](#input\_security\_bypass\_list\_id) | Security Bypass List IPs Network List ID | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_enable_client_rep"></a> [enable\_client\_rep](#input\_enable\_client\_rep) | On/Off option for Client Reputation feature | `bool` | `true` | no |
| <a name="input_enable_siem"></a> [enable\_siem](#input\_enable\_siem) | On/Off option for SIEM feature | `bool` | `true` | no |
| <a name="input_enable_slow_post"></a> [enable\_slow\_post](#input\_enable\_slow\_post) | On/Off option for Slow Post feature | `bool` | `true` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | n/a | `string` | `"default"` | no |
| <a name="input_policy_prefix"></a> [policy\_prefix](#input\_policy\_prefix) | n/a | `string` | `"DEF1"` | no |

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