<!-- BEGIN_TF_DOCS -->

This defines a PM Include that will be managed by each micro-services team. It
will be used by each individual microservices development team in isolation from
each other and in isolation from the centrally managed property. Each team will
have their own state file for proper separation of concerns. This module requires
rule json to be submitted. It's expected, but not mandated, that this will be
provided by an akamai\_property\_rules\_builder datasource that's managed by the
application team. See the "team1" example folder for usage.

This module outputs the include id. The user of this module should also pass this
on as an output so it can be obtained from the terraform\_remote\_state datasource

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 contacts  = <list(string)>
  	 contract_id  = <string>
  	 group_id  = <string>
  	 include_name  = <string>
  	 rule_format  = <string>
  	 rules  = <string>
  
	 # Optional variables
  	 product_id  = <string> | default: "prd_Fresca"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | >= 7.1.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_property_include.test_include](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_include) | resource |
| [akamai_property_include_activation.test_include_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_include_activation) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contacts"></a> [contacts](#input\_contacts) | A list of contacts who will be contacted when this config is deployed | `list(string)` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | n/a | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | n/a | `string` | n/a | yes |
| <a name="input_include_name"></a> [include\_name](#input\_include\_name) | Name for your include | `string` | n/a | yes |
| <a name="input_rule_format"></a> [rule\_format](#input\_rule\_format) | The rule format as returned by the akamai\_property\_rules\_builder | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | The json rule tree as returned by the akamai\_property\_rules\_builder | `string` | n/a | yes |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Name of the required product | `string` | `"prd_Fresca"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->