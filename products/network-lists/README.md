<!-- BEGIN_TF_DOCS -->

# Network Lists Module

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
  	 email  = <string>
  	 group_id  = <string>
  	 prefix  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 geo_block_list  = <list(any)> | default: []
  	 ip_block_list  = <list(any)> | default: []
  	 ip_block_list_exceptions  = <list(any)> | default: []
  	 pragma_exceptions  = <list(any)> | default: []
  	 rate_bypass_list  = <list(any)> | default: []
  	 security_bypass_list  = <list(any)> | default: []
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
| [akamai_networklist_activations.geo_block_list_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.geo_block_list_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.ip_block_list_exceptions_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.ip_block_list_exceptions_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.ip_block_list_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.ip_block_list_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.pragma_exceptions_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.pragma_exceptions_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.rate_bypass_list_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.rate_bypass_list_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.security_bypass_list_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_activations.security_bypass_list_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_activations) | resource |
| [akamai_networklist_network_list.geo_block_list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.ip_block_list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.ip_block_list_exceptions](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.pragma_exceptions](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.rate_bypass_list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.security_bypass_list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID for property/config creation | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Email address used for activations | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID for property/config creation | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for list names | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_geo_block_list"></a> [geo\_block\_list](#input\_geo\_block\_list) | Geo Block List Geos | `list(any)` | `[]` | no |
| <a name="input_ip_block_list"></a> [ip\_block\_list](#input\_ip\_block\_list) | IP Block List IPs | `list(any)` | `[]` | no |
| <a name="input_ip_block_list_exceptions"></a> [ip\_block\_list\_exceptions](#input\_ip\_block\_list\_exceptions) | IP Block List Exceptions IPs | `list(any)` | `[]` | no |
| <a name="input_pragma_exceptions"></a> [pragma\_exceptions](#input\_pragma\_exceptions) | Pragma Removal Exceptions IPs | `list(any)` | `[]` | no |
| <a name="input_rate_bypass_list"></a> [rate\_bypass\_list](#input\_rate\_bypass\_list) | Rate Control Bypass List IPs | `list(any)` | `[]` | no |
| <a name="input_security_bypass_list"></a> [security\_bypass\_list](#input\_security\_bypass\_list) | Security Bypass List IPs | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_geo_block_list_id"></a> [geo\_block\_list\_id](#output\_geo\_block\_list\_id) | n/a |
| <a name="output_ip_block_list_exceptions_id"></a> [ip\_block\_list\_exceptions\_id](#output\_ip\_block\_list\_exceptions\_id) | n/a |
| <a name="output_ip_block_list_id"></a> [ip\_block\_list\_id](#output\_ip\_block\_list\_id) | n/a |
| <a name="output_pragma_exceptions_id"></a> [pragma\_exceptions\_id](#output\_pragma\_exceptions\_id) | n/a |
| <a name="output_rate_bypass_list_id"></a> [rate\_bypass\_list\_id](#output\_rate\_bypass\_list\_id) | n/a |
| <a name="output_security_bypass_list_id"></a> [security\_bypass\_list\_id](#output\_security\_bypass\_list\_id) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->