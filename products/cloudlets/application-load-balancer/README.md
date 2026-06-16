<!-- BEGIN_TF_DOCS -->

# Application Load Balancer Cloudlet Module

This is a simple example of an Application Load Balancer policy

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
  	 associated_properties  = <list(string)>
  	 description  = <string>
  	 group_id  = <string>
  	 origin_id_1  = <string>
  	 origin_id_2  = <string>
  	 policy_name  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 env  = <string> | default: "staging"
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
| [akamai_cloudlets_application_load_balancer.load_balancer_demo_LB_ID](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_application_load_balancer) | resource |
| [akamai_cloudlets_application_load_balancer.load_balancer_demo_LB_ID_2](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_application_load_balancer) | resource |
| [akamai_cloudlets_application_load_balancer_activation.load_balancer_activation_demo_LB_ID](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_application_load_balancer_activation) | resource |
| [akamai_cloudlets_application_load_balancer_activation.load_balancer_activation_demo_LB_ID_2](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_application_load_balancer_activation) | resource |
| [akamai_cloudlets_policy.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_policy) | resource |
| [akamai_cloudlets_policy_activation.policy_activation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_policy_activation) | resource |
| [akamai_cloudlets_application_load_balancer_match_rule.match_rules_alb](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/cloudlets_application_load_balancer_match_rule) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_associated_properties"></a> [associated\_properties](#input\_associated\_properties) | List of associated properties for the Cloudlet policy | `list(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Cloudlet version description | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID for the Cloudlet policy | `string` | n/a | yes |
| <a name="input_origin_id_1"></a> [origin\_id\_1](#input\_origin\_id\_1) | Origin ID for the first data center | `string` | n/a | yes |
| <a name="input_origin_id_2"></a> [origin\_id\_2](#input\_origin\_id\_2) | Origin ID for the second data center | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Cloudlet Policy Name | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `"staging"` | no |

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