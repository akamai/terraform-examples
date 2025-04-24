<!-- BEGIN_TF_DOCS -->



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
  	 challenges  = <map(string)>
  	 contacts  = <list(string)>
  	 contract_id  = <string>
  	 edge_hostname  = <string>
  	 group_id  = <string>
  	 hostnames  = <list(string)>
  	 property_name  = <string>
  	 zone  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 compliance_record  = <object({
    reason           = string
    peer_reviewed_by = optional(string)
    customer_email   = optional(string)
    unit_tested      = optional(bool)
  })> | default: null
  	 product_id  = <string> | default: "prd_Fresca"
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
| <a name="module_delivery"></a> [delivery](#module\_delivery) | ../modules/property | n/a |
| <a name="module_dns"></a> [dns](#module\_dns) | ../modules/dns | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_challenges"></a> [challenges](#input\_challenges) | A map of challenge hostnames to their CNAME targets | `map(string)` | n/a | yes |
| <a name="input_contacts"></a> [contacts](#input\_contacts) | A list of contacts who will be contacted when this config is deployed | `list(string)` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID | `string` | n/a | yes |
| <a name="input_edge_hostname"></a> [edge\_hostname](#input\_edge\_hostname) | Your Edge Hostname (without .edgesuite.net domain suffix) | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | A list of hostnames to create challenges for. Unfortunately this is needed because Terraform wants to know how many records it's creating at plan time and challenges map isn't know until run time | `list(string)` | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Name for your property | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The DNS zone that we're adding the challenge records | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_compliance_record"></a> [compliance\_record](#input\_compliance\_record) | For Akamai internal change management process | <pre>object({<br/>    reason           = string<br/>    peer_reviewed_by = optional(string)<br/>    customer_email   = optional(string)<br/>    unit_tested      = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Name of the required product | `string` | `"prd_Fresca"` | no |

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