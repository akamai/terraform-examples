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

# Example
An example is shown below. Please refer to the example directory in this git repo for further details
```hcl
data "akamai_contract" "contract" {
  group_name = var.group_name
}

module "client-lists" {
  source              = "../modules/client-lists"
  client_lists_prefix = substr(var.config_name, 0, 20)
  config_name         = var.config_name
  contract_id         = trimprefix(data.akamai_contract.contract.id, "ctr_")
  group_id            = trimprefix(data.akamai_contract.contract.group_id, "grp_")
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
| [akamai_contract.contract](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/contract) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_client-lists"></a> [client-lists](#module\_client-lists) | ../modules/client-lists | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_config_name"></a> [config\_name](#input\_config\_name) | Security Configuration Name. Used to create the prefix and description for the network lists. | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Akamai Group Name | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |

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