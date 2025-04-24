<!-- BEGIN_TF_DOCS -->



# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 challenges  = <map(string)>
  	 hostnames  = <list(string)>
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
| [akamai_dns_record.validations](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_challenges"></a> [challenges](#input\_challenges) | A map of challenge hostnames to their CNAME targets | `map(string)` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | A list of hostnames to create challenges for. Unfortunately this is needed because Terraform wants to know how many records it's creating at plan time and challenges map isn't know until run time | `list(string)` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The DNS zone that we're adding the challenge records | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hostnames"></a> [hostnames](#output\_hostnames) | The hostnames that were passed to us when we created these properties |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->