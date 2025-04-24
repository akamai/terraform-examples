<!-- BEGIN_TF_DOCS -->

This is an example of how a microservices development team might manage
their own PM Include. The Property Manager Rules and Behaviours are
configured locally here and passed to the module. It's expected that you'll
use an akamai\_property\_rules\_builder datasource to manage these rules but
you could use raw json, JSonnet or even YAML to manage these, provided
they are converted back to valid json before passing to the module

This configuration instance will maintain its own state file so it can
work completely in isolation from other development teams or the central
devops team. However, the central team's Terraform instance will read the
include id from this state file when they apply their changes.

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
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
| [akamai_cp_code.cp_code](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cp_code) | resource |
| [akamai_property_rules_builder.test_include_rule_default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_include"></a> [include](#module\_include) | ../modules/includes | n/a |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | It's important to output the include id |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->