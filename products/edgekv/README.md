<!-- BEGIN_TF_DOCS -->

# EdgeKV

## Create a New EdgeKV Namespace, Groups and Items
Creates a new EdgeKV namespace and 2 new groups within the namespaces. It also creates items inside both groups.

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
  	 ekv_group_name_1  = <string>
  	 ekv_group_name_2  = <string>
  	 group_name  = <string>
  	 namespace_name  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
  	 geo_location  = <string> | default: "US"
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
| [akamai_edgekv.edgekv](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/edgekv) | resource |
| [akamai_edgekv_group_items.countries_group](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/edgekv_group_items) | resource |
| [akamai_edgekv_group_items.translations_group](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/edgekv_group_items) | resource |
| [akamai_contract.contract](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/contract) | data source |
| [akamai_edgekv_group_items.countries_group](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/edgekv_group_items) | data source |
| [akamai_edgekv_group_items.translations_group](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/edgekv_group_items) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_ekv_group_name_1"></a> [ekv\_group\_name\_1](#input\_ekv\_group\_name\_1) | Edge KV Group Name #1 | `string` | n/a | yes |
| <a name="input_ekv_group_name_2"></a> [ekv\_group\_name\_2](#input\_ekv\_group\_name\_2) | Edge KV Group Name #2 | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Akamai Group Name | `string` | n/a | yes |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | EKV Namespace Name | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_geo_location"></a> [geo\_location](#input\_geo\_location) | Geo Location for EKV Database | `string` | `"US"` | no |
| <a name="input_network"></a> [network](#input\_network) | Akamai Network (staging or production) | `string` | `"staging"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_countries"></a> [countries](#output\_countries) | Map of items for the countries group |
| <a name="output_languages"></a> [languages](#output\_languages) | Map of items for the languages group |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->