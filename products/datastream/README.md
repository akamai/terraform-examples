<!-- BEGIN_TF_DOCS -->

# DataStream

## Create a New Data Stream
Creates a new data stream with all available data sets enabled.

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
  	 group_name  = <string>
  	 notification_emails  = <list(string)>
  	 properties  = <list(string)>
  	 stream_name  = <string>
  	 sumologic_connector_code  = <any>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 7.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | = 6.2.0 |
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | = 2.23.0 |
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | = 2.23.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_datastream.my_datastream](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/resources/datastream) | resource |
| [akamai_contract.contract](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/contract) | data source |
| [akamai_datastream_dataset_fields.all_fields](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/datastream_dataset_fields) | data source |
| [akamai_datastreams.my_datastreams](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/datastreams) | data source |
| [akamai_property.properties](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/property) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Akamai Group Name | `string` | n/a | yes |
| <a name="input_notification_emails"></a> [notification\_emails](#input\_notification\_emails) | List of Notification Emails | `list(string)` | n/a | yes |
| <a name="input_properties"></a> [properties](#input\_properties) | List of Associated Properties to the DataStream | `list(string)` | n/a | yes |
| <a name="input_stream_name"></a> [stream\_name](#input\_stream\_name) | DataStream Name | `string` | n/a | yes |
| <a name="input_sumologic_connector_code"></a> [sumologic\_connector\_code](#input\_sumologic\_connector\_code) | n/a | `any` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_fields"></a> [all\_fields](#output\_all\_fields) | All Datastream Fields |
| <a name="output_datastream_id"></a> [datastream\_id](#output\_datastream\_id) | Datastream ID |
| <a name="output_datastream_info"></a> [datastream\_info](#output\_datastream\_info) | Datastream Info |
| <a name="output_my_datastreams"></a> [my\_datastreams](#output\_my\_datastreams) | All Datastreams |
| <a name="output_my_property_ids"></a> [my\_property\_ids](#output\_my\_property\_ids) | Property Ids |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->