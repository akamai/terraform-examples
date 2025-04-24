<!-- BEGIN_TF_DOCS -->

This module will update DNS to CNAME the site to the edge hostname. It has a
precondition in place to check that the SBD certs are deployed before it will
allow this to happen. You should therefore wait ~8mins between updating the
properties with the new hostnames and  running this script. If the precondition
fails, you should wait a short while and try again

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 edge_hostname  = <string>
  	 hostnames  = <list(string)>
  	 property_name  = <string>
  	 zone  = <string>
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
| [akamai_dns_record.golive](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_property.property](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property) | data source |
| [akamai_property_hostnames.hostnames](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_hostnames) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_edge_hostname"></a> [edge\_hostname](#input\_edge\_hostname) | Your Edge Hostname (without .edgesuite.net domain suffix) | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | A list of hostnames to include in this configuration | `list(string)` | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Name for your property | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The DNS zone that we're going live with | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_status"></a> [status](#output\_status) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->