An example of how to manage an Image Manager configuration using Terraform

## Providers

| Name | Version |
|------|---------|
| <a name="provider_akamai"></a> [akamai](#provider\_akamai) | ~> 7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_on_production"></a> [activate\_on\_production](#input\_activate\_on\_production) | Boolean switch to activate to production. If false, policy is only pushed to staging | `bool` | `false` | no |
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID for property/config creation | `string` | n/a | yes |
| <a name="input_policy_set_name"></a> [policy\_set\_name](#input\_policy\_set\_name) | Name for policyset | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The geographic region for which the media using this policy set is optimized: US, EMEA, ASIA, AUSTRALIA, JAPAN or CHINA | `string` | `"US"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_policyset_id"></a> [image\_policyset\_id](#output\_image\_policyset\_id) | n/a |

<!-- BEGIN_TF_DOCS -->

# Image Manager Module

An example of how to manage an Image Manager configuration using Terraform

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
  	 policy_set_name  = <string>
  
	 # Optional variables
  	 activate_on_production  = <bool> | default: false
  	 akamai_account_key  = <string> | default: ""
  	 region  = <string> | default: "US"
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
| [akamai_imaging_policy_image.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/imaging_policy_image) | resource |
| [akamai_imaging_policy_set.images](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/imaging_policy_set) | resource |

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
| <a name="input_policy_set_name"></a> [policy\_set\_name](#input\_policy\_set\_name) | Name for policyset | `string` | n/a | yes |
| <a name="input_activate_on_production"></a> [activate\_on\_production](#input\_activate\_on\_production) | Boolean switch to activate to production. If false, policy is only pushed to staging | `bool` | `false` | no |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The geographic region for which the media using this policy set is optimized: US, EMEA, ASIA, AUSTRALIA, JAPAN or CHINA | `string` | `"US"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_policyset_id"></a> [image\_policyset\_id](#output\_image\_policyset\_id) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->