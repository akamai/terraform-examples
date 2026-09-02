<!-- BEGIN_TF_DOCS -->

# Application Load Balancer Cloudlet Module

This is a simple example of an Application Load Balancer policy

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 alb_lb_data_centers  = <map(object({
    origin_id                    = string
    load_balancer_hostname       = string
    load_balancer_liveness_hosts = list(string)
  }))>
  	 alb_load_balancers  = <map(object({
    id                  = string
    description         = string
    version_description = string
    balancing_type      = string
  }))>
  	 associated_properties  = <list(string)>
  	 description  = <string>
  	 group_id  = <string>
  	 policy_name  = <string>
  
	 # Optional variables
  	 config_section  = <string> | default: "default"
  	 edgerc_path  = <string> | default: "~/.edgerc"
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
| <a name="input_alb_lb_data_centers"></a> [alb\_lb\_data\_centers](#input\_alb\_lb\_data\_centers) | Map of ALB configuration parameters | <pre>map(object({<br/>    origin_id                    = string<br/>    load_balancer_hostname       = string<br/>    load_balancer_liveness_hosts = list(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_alb_load_balancers"></a> [alb\_load\_balancers](#input\_alb\_load\_balancers) | Map of load balancer configurations | <pre>map(object({<br/>    id                  = string<br/>    description         = string<br/>    version_description = string<br/>    balancing_type      = string<br/>  }))</pre> | n/a | yes |
| <a name="input_associated_properties"></a> [associated\_properties](#input\_associated\_properties) | List of associated properties for the Cloudlet policy | `list(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Cloudlet version description | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID for the Cloudlet policy | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Cloudlet Policy Name | `string` | n/a | yes |
| <a name="input_config_section"></a> [config\_section](#input\_config\_section) | EdgeRC section. Change this to switch between accounts, assuming your section has an account\_id member | `string` | `"default"` | no |
| <a name="input_edgerc_path"></a> [edgerc\_path](#input\_edgerc\_path) | Path to .edgerc file. Defaults to ~/.edgerc | `string` | `"~/.edgerc"` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `"staging"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_policy_id"></a> [alb\_policy\_id](#output\_alb\_policy\_id) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->