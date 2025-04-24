<!-- BEGIN_TF_DOCS -->

This is an example of how a central team would manage the main delivery
property that manages your website. Associated PM Includes will be
managed individually by each development team. The ids of each include
are fetched by the terraform\_remote\_state datasource. You should configure
each of these below and add them to the "includes" map that's passed to
the module. This will cause a new rule to be added to the Property Manager
config that contains each of the microservice mappings

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
| [terraform_remote_state.team1](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_delivery"></a> [delivery](#module\_delivery) | ../modules/property | n/a |

## Inputs

No inputs.

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