<!-- BEGIN_TF_DOCS -->

# Create Best Practice Client Lists

The use case for this module is to quickly create new Client Lists for an Application Security Configuration

The following Client Lists are created:
* IP Block
* IP Block Exception
* Geo Block
* Security Bypass
* Rate Control Bypass
* Pragma Bypass
* Client Reputation Bypass

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 client_lists_prefix  = <string>
  	 config_name  = <string>
  	 contract_id  = <string>
  	 group_id  = <string>
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
| [akamai_clientlist_list.client-lists-geoblock-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/clientlist_list) | resource |
| [akamai_clientlist_list.client-lists-ipblock](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/clientlist_list) | resource |
| [akamai_clientlist_list.client-lists-ipblock-list-exceptions](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/clientlist_list) | resource |
| [akamai_clientlist_list.client-lists-pragmabypass-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/clientlist_list) | resource |
| [akamai_clientlist_list.client-lists-rcbypass-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/clientlist_list) | resource |
| [akamai_clientlist_list.client-lists-reputationbypass-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/clientlist_list) | resource |
| [akamai_clientlist_list.client-lists-securitybypass-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/clientlist_list) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_lists_prefix"></a> [client\_lists\_prefix](#input\_client\_lists\_prefix) | Prefix for the Client Lists | `string` | n/a | yes |
| <a name="input_config_name"></a> [config\_name](#input\_config\_name) | Security configuration name | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Akamai Contract ID | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Akamai Group ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_lists_geoblock_id"></a> [client\_lists\_geoblock\_id](#output\_client\_lists\_geoblock\_id) | ID for the Geo Block Client List |
| <a name="output_client_lists_ipblock_exception_id"></a> [client\_lists\_ipblock\_exception\_id](#output\_client\_lists\_ipblock\_exception\_id) | ID for the IP Block Exceptions Client List |
| <a name="output_client_lists_ipblock_id"></a> [client\_lists\_ipblock\_id](#output\_client\_lists\_ipblock\_id) | ID for the IP Block Client List |
| <a name="output_client_lists_pragmabypass_id"></a> [client\_lists\_pragmabypass\_id](#output\_client\_lists\_pragmabypass\_id) | ID for the Pragma Bypass Client List |
| <a name="output_client_lists_rcbypass_id"></a> [client\_lists\_rcbypass\_id](#output\_client\_lists\_rcbypass\_id) | ID for the Rate Control Bypass Client List |
| <a name="output_client_lists_reputationbypass_id"></a> [client\_lists\_reputationbypass\_id](#output\_client\_lists\_reputationbypass\_id) | ID for the reputation Bypass Client List |
| <a name="output_client_lists_securitybypass_id"></a> [client\_lists\_securitybypass\_id](#output\_client\_lists\_securitybypass\_id) | ID for the Security Bypass Client List |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->