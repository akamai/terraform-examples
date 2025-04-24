<!-- BEGIN_TF_DOCS -->

# Edge Redirector Module driven by CSV

This Terraform module implements an Edge Redirector policy with its
input as a csv file similar to one that you'd download from the Akamai
Control Centre GUI

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 associated_properties  = <list(string)>
  	 csv  = <string>
  	 group_id  = <string>
  	 policy_name  = <string>
  
	 # Optional variables
  	 env  = <string> | default: "staging"
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
| [akamai_cloudlets_policy.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_policy) | resource |
| [akamai_cloudlets_policy_activation.policy_activation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_policy_activation) | resource |
| [akamai_cloudlets_edge_redirector_match_rule.match_rules_er](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/cloudlets_edge_redirector_match_rule) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associated_properties"></a> [associated\_properties](#input\_associated\_properties) | The properties that are associated with this cloudlet policy | `list(string)` | n/a | yes |
| <a name="input_csv"></a> [csv](#input\_csv) | The CSV file is similar to one that you'd download from Control Center GUI and should have the following headings:-<pre>ruleName,matchURL,useRelativeUrl,redirectURL,statusCode</pre>In addition, it should be passed to the module as follows:-<pre>csv = file(\"redirects.csv\")</pre> | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | The group id that contains your cloudlet | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name of the cloudlet policy | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment to which this should be deployed | `string` | `"staging"` | no |

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