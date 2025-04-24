<!-- BEGIN_TF_DOCS -->

# Edge Redirector Cloudlet for Multiple Environments - Alternate Match Rules

The purpose of this template is to ease the process of managing multiple environment cloudlet policies (e.g. dev, qa, stage, prod) which require different match rules in Terraform by leveraging the [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs).

## Terraform plan/apply
To plan/apply a specific environment:

`$ terraform plan -var-file=./environments/dev.tfvars`

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
  	 environment  = <string>
  	 group_name  = <string>
  	 policy_name  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 cloudlet_code  = <string> | default: "ER"
  	 description  = <string> | default: "ER Cloudlet deployed by TF"
  	 network  = <string> | default: "staging"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 7.0 |
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | = 2.23.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_cloudlets_policy.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_policy) | resource |
| [akamai_cloudlets_policy_activation.policy_activation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_policy_activation) | resource |
| [akamai_cloudlets_edge_redirector_match_rule.match_rules_er_default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/cloudlets_edge_redirector_match_rule) | data source |
| [akamai_cloudlets_edge_redirector_match_rule.match_rules_er_dev](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/cloudlets_edge_redirector_match_rule) | data source |
| [akamai_cloudlets_edge_redirector_match_rule.match_rules_er_qa](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/cloudlets_edge_redirector_match_rule) | data source |
| [akamai_cloudlets_edge_redirector_match_rule.match_rules_er_test](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/cloudlets_edge_redirector_match_rule) | data source |
| [akamai_contract.contract](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/contract) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment to deploy/activate | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Akamai Group Name | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Cloudlet Policy Name | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_cloudlet_code"></a> [cloudlet\_code](#input\_cloudlet\_code) | Cloudlet Type Code | `string` | `"ER"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the Cloudlet Policy | `string` | `"ER Cloudlet deployed by TF"` | no |
| <a name="input_network"></a> [network](#input\_network) | Akamai Network: staging or production | `string` | `"staging"` | no |

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