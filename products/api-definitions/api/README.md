<!-- BEGIN_TF_DOCS -->

# API Definitions Example (JSON)

This example creates and activates an Akamai API definition using a raw JSON
file as the API descriptor. It covers the full lifecycle from definition
creation through activation on both the Staging and Production networks.

## Workflow

1. `akamai_group` data source resolves the contract and group IDs required by
   all subsequent resources.
2. `akamai_apidefinitions_api` creates the API definition by uploading the
   contents of `api.json`. Any update to that file triggers a new API version.
3. `akamai_apidefinitions_activation` activates the latest version on
   **STAGING** and **PRODUCTION** independently, so each network can be
   managed and rolled back separately.

## API Definition File

The API is described in `api.json`. This file must conform to the schema
expected by the Akamai API Definitions API. For an alternative that derives
the JSON payload automatically from an OpenAPI specification, see the
companion `openapi/` example which uses the
`akamai_apidefinitions_openapi` data source.

## ⚠️ ID Prefix Stripping

The Akamai provider returns `contract_id` and `group_id` values prefixed with
`ctr_` and `grp_` respectively. The `trimprefix()` calls remove these prefixes
before passing the values to `akamai_apidefinitions_api`, which expects bare
numeric IDs.

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 contract_id  = <string>
  	 emails  = <list(string)>
  	 group_name  = <string>
  	 notes  = <string>
  
	 # Optional variables
  	 config_section  = <string> | default: "tf"
  	 edgerc_path  = <string> | default: "~/.edgerc"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 10.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_apidefinitions_activation.api_activation_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/apidefinitions_activation) | resource |
| [akamai_apidefinitions_activation.api_activation_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/apidefinitions_activation) | resource |
| [akamai_apidefinitions_api.api](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/apidefinitions_api) | resource |
| [akamai_group.group](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/group) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | n/a | `string` | n/a | yes |
| <a name="input_emails"></a> [emails](#input\_emails) | n/a | `list(string)` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_notes"></a> [notes](#input\_notes) | Version notes to include with each activation | `string` | n/a | yes |
| <a name="input_config_section"></a> [config\_section](#input\_config\_section) | EdgeRC section. Change this to switch between accounts, assuming your section has an account\_id member | `string` | `"tf"` | no |
| <a name="input_edgerc_path"></a> [edgerc\_path](#input\_edgerc\_path) | Path to .edgerc file. Defaults to ~/.edgerc | `string` | `"~/.edgerc"` | no |

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