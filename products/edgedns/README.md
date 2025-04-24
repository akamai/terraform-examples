Demonstrate how to use EdgeDNS provider

## Providers

| Name | Version |
|------|---------|
| <a name="provider_akamai"></a> [akamai](#provider\_akamai) | ~> 7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_config_section"></a> [config\_section](#input\_config\_section) | EdgeRC section. Change this to switch between accounts, assuming your section has an account\_id member | `string` | `"default"` | no |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID | `string` | n/a | yes |
| <a name="input_edgerc_path"></a> [edgerc\_path](#input\_edgerc\_path) | Path to .edgerc file. Defaults to ~/.edgerc | `string` | `"~/.edgerc"` | no |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID | `number` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Name of your zone | `string` | n/a | yes |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->

# EdgeDNS Module

Demonstrate how to use EdgeDNS provider

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
  	 contract_id  = <string>
  	 group_id  = <number>
  	 zone  = <string>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
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
| [akamai_dns_record._dnsauth_TXT](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record._sipfederationtls__tcp__tcp_SRV](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.autodiscover_CNAME](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.kibana_A](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.origin-blue_CNAME](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.origin-demo_CNAME](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.origin1_A](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.origin_CNAME](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.secure_CNAME](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.shop_CNAME](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.tld_AKAMAITLC](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.tld_CAA](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.tld_NS](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.tld_SOA](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.tld_TXT](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.vpn_A](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_record.www_CNAME](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_dns_zone.tld](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_zone) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID | `number` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Name of your zone | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |

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