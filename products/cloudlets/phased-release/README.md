This is a simple example of a shared phased release policy

## Providers

| Name | Version |
|------|---------|
| <a name="provider_akamai"></a> [akamai](#provider\_akamai) | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_section"></a> [config\_section](#input\_config\_section) | n/a | `string` | `"default"` | no |
| <a name="input_edgerc_path"></a> [edgerc\_path](#input\_edgerc\_path) | n/a | `string` | `"~/.edgerc"` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `"staging"` | no |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->

# Phased Release Cloudlet Module

This is a simple example of a shared phased release policy

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
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 env  = <string> | default: "staging"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | >= 7.0.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_cloudlets_policy.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_policy) | resource |
| [akamai_cloudlets_policy_activation.policy_activation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cloudlets_policy_activation) | resource |
| [akamai_cloudlets_phased_release_match_rule.match_rules_cd](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/cloudlets_phased_release_match_rule) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
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