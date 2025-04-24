<!-- BEGIN_TF_DOCS -->

# Create Domain Validation Enrollment
This module creates a Domain Validation certificate enrollment at Akamai

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
  	 group_id  = <string>
  	 hostname  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 enhanced_tls  = <bool> | default: false
  	 ip_behavior  = <string> | default: "IPV6_COMPLIANCE"
  	 product_id  = <string> | default: "Fresca"
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
| [akamai_cps_dv_enrollment.certificate](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cps_dv_enrollment) | resource |
| [local_file.dns_challenges_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

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
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID for property/config creation | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname to include in configs/properties | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_enhanced_tls"></a> [enhanced\_tls](#input\_enhanced\_tls) | n/a | `bool` | `false` | no |
| <a name="input_ip_behavior"></a> [ip\_behavior](#input\_ip\_behavior) | n/a | `string` | `"IPV6_COMPLIANCE"` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | n/a | `string` | `"Fresca"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_id"></a> [certificate\_id](#output\_certificate\_id) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->