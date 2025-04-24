# Terraform Snippets

This directory contains random incomplete snippets of configuration that you might find useful
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
  	 hostname  = <map(string)>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 config_section  = <string> | default: "default"
  	 edgerc_path  = <string> | default: "~/.edgerc"
}
 ```

## Requirements

No requirements.

## Resources

| Name | Type |
|------|------|
| [akamai_cp_code.cp_code](https://registry.terraform.io/providers/hashicorp/akamai/latest/docs/resources/cp_code) | resource |
| [akamai_dns_record.golive](https://registry.terraform.io/providers/hashicorp/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.validations](https://registry.terraform.io/providers/hashicorp/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_property.lab](https://registry.terraform.io/providers/hashicorp/akamai/latest/docs/resources/property) | resource |
| [akamai_botman_akamai_defined_bot.defined_bots](https://registry.terraform.io/providers/hashicorp/akamai/latest/docs/data-sources/botman_akamai_defined_bot) | data source |
| [akamai_property_rules_builder.sports_rule_other_origins](https://registry.terraform.io/providers/hashicorp/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.sports_rule_sports](https://registry.terraform.io/providers/hashicorp/akamai/latest/docs/data-sources/property_rules_builder) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The input variable in this example is a map of strings where the key is the hostname and the value is the origin hostname | `map(string)` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_config_section"></a> [config\_section](#input\_config\_section) | EdgeRC section. Change this to switch between accounts, assuming your section has an account\_id member | `string` | `"default"` | no |
| <a name="input_edgerc_path"></a> [edgerc\_path](#input\_edgerc\_path) | Path to .edgerc file. Defaults to ~/.edgerc | `string` | `"~/.edgerc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_defined_bots_json"></a> [defined\_bots\_json](#output\_defined\_bots\_json) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->