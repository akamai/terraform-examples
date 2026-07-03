<!-- BEGIN_TF_DOCS -->

# ALB + Property Manager Workflow

This directory is used in STAGE 1 and STAGE 3 of the full onboarding workflow.
Stage 2 (ALB setup) lives in the sibling ../alb/ directory.

## STAGE 1 — Initial Property and ALB Setup
  ```
  terraform apply
  ```

  1. Creates the property via the rules-as-hcl module.
  2. Adds conditional origins to the property rules. Conditional origins are
     origin behaviors with a unique origin\_id (e.g. "origin-a", "origin-b")
     that the ALB cloudlet policy will reference in Stage 2. Add them to the
     rules-as-hcl/rules sub-module before applying.
  3. Activates the property to Akamai Staging/Production.

## STAGE 1 Continued — ALB Setup

  4. Creates the ALB cloudlet policy with match rules.
  5. Creates load balancers using the conditional origin IDs defined in the
     Stage 1 property rules (origin\_id\_1 and origin\_id\_2 must match exactly).
  6. Activates the ALB policy and load balancers to staging/production.

After Stage 1 completes, note the alb\_cloudlet\_policy\_id from the output.
This will be used in Stage 2 to add the ALB behavior to the property rules.

## STAGE 2 — Add ALB Behavior (new property onboarding only)
  Uncomment the alb\_cloudlet\_policy\_id and set the value from the previous output
  (policy ID) in your tfvars file, then run:

  ```
  terraform apply
  ```

  1. Updates the property rules to include the ALB cloudlet behavior pointing
     to the policy created in Stage 2.
  2. Activates the updated property to Staging (and Production if configured).

  NOTE: Run this AFTER Stage 2 has completed successfully.

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
  	 contacts  = <list(string)>
  	 default_origin  = <string>
  	 group_name  = <string>
  	 hostname  = <string>
  	 property_name  = <string>
  
	 # Optional variables
  	 activate_latest_on_production  = <bool> | default: false
  	 activate_latest_on_staging  = <bool> | default: false
  	 activation_network  = <string> | default: "staging"
  	 alb_cloudlet_policy_id  = <number> | default: 0
  	 alb_cloudlet_policy_name  = <string> | default: ""
  	 description  = <string> | default: "Managed by Terraform"
  	 notes  = <string> | default: "Managed by Terraform"
  	 product_id  = <string> | default: "Fresca"
  	 rule_format  = <string> | default: "v2025-01-13"
  	 sure_route_test_object  = <string> | default: "/akamai/testobject.html"
  	 td_region  = <string> | default: "CH2"
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
| [akamai_contract.contract](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/contract) | data source |
| [akamai_property_rules_builder.rule_alb_behavior](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.rule_conditional_origin_a_definition](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.rule_conditional_origin_b_definition](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.rule_conditional_origin_group](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ../../products/cloudlets/application-load-balancer | n/a |
| <a name="module_property"></a> [property](#module\_property) | ../../products/property/rules-as-hcl | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_lb_data_centers"></a> [alb\_lb\_data\_centers](#input\_alb\_lb\_data\_centers) | Map of ALB configuration parameters | <pre>map(object({<br/>    origin_id                    = string<br/>    load_balancer_hostname       = string<br/>    load_balancer_liveness_hosts = list(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_alb_load_balancers"></a> [alb\_load\_balancers](#input\_alb\_load\_balancers) | Map of load balancer configurations | <pre>map(object({<br/>    id                  = string<br/>    description         = string<br/>    version_description = string<br/>    balancing_type      = string<br/>  }))</pre> | n/a | yes |
| <a name="input_contacts"></a> [contacts](#input\_contacts) | Notification email contacts for property activations | `list(string)` | n/a | yes |
| <a name="input_default_origin"></a> [default\_origin](#input\_default\_origin) | Default origin server hostname | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Akamai group name | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname for the property | `string` | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Property name | `string` | n/a | yes |
| <a name="input_activate_latest_on_production"></a> [activate\_latest\_on\_production](#input\_activate\_latest\_on\_production) | n/a | `bool` | `false` | no |
| <a name="input_activate_latest_on_staging"></a> [activate\_latest\_on\_staging](#input\_activate\_latest\_on\_staging) | n/a | `bool` | `false` | no |
| <a name="input_activation_network"></a> [activation\_network](#input\_activation\_network) | Network to activate on: staging or production | `string` | `"staging"` | no |
| <a name="input_alb_cloudlet_policy_id"></a> [alb\_cloudlet\_policy\_id](#input\_alb\_cloudlet\_policy\_id) | ALB cloudlet policy ID. Leave empty for Stage 1 (initial setup).<br/>Set to the policy ID created in Stage 2 when running Stage 3 (add ALB behavior).<br/>Requires the rules-as-hcl module to support this variable. | `number` | `0` | no |
| <a name="input_alb_cloudlet_policy_name"></a> [alb\_cloudlet\_policy\_name](#input\_alb\_cloudlet\_policy\_name) | ALB cloudlet policy name. Leave empty for Stage 1 (initial setup).<br/>Set to the policy name created in Stage 2 when running Stage 3 (add ALB behavior).<br/>Requires the rules-as-hcl module to support this variable. | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | ALB policy description / change notes | `string` | `"Managed by Terraform"` | no |
| <a name="input_notes"></a> [notes](#input\_notes) | Version notes for property changes | `string` | `"Managed by Terraform"` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Property Manager product ID. Defaults to Ion Standard (Fresca) | `string` | `"Fresca"` | no |
| <a name="input_rule_format"></a> [rule\_format](#input\_rule\_format) | Static rule format schema. Must match the data source format in rules-as-hcl module | `string` | `"v2025-01-13"` | no |
| <a name="input_sure_route_test_object"></a> [sure\_route\_test\_object](#input\_sure\_route\_test\_object) | Test object path for SureRoute | `string` | `"/akamai/testobject.html"` | no |
| <a name="input_td_region"></a> [td\_region](#input\_td\_region) | Region for Tiered Distribution. Options: CH2, CHAPAC, CHEU2, CHEUS2, CHWUS2, CHCUS2, CHAUS | `string` | `"CH2"` | no |

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