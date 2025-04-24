Here is an example of how to provision an Edgeworker, create the tarball,
deploy the bundle to Akamai and activate. If the bundle changes, a new
tarball will be created and a new version of the Edgeworker will activate

## Providers

| Name | Version |
|------|---------|
| <a name="provider_akamai"></a> [akamai](#provider\_akamai) | ~> 7.0 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_config_section"></a> [config\_section](#input\_config\_section) | Name of the section in your .edgerc file containing your api credentials | `string` | `"default"` | no |
| <a name="input_edgerc_path"></a> [edgerc\_path](#input\_edgerc\_path) | Location of your .edgerc file | `string` | `"~/.edgerc"` | no |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | The group id that contains your cloudlet | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Edgeworker | `string` | n/a | yes |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->

Here is an example of how to provision an Edgeworker, create the tarball,
deploy the bundle to Akamai and activate. If the bundle changes, a new
tarball will be created and a new version of the Edgeworker will activate

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
  	 group_id  = <string>
  	 name  = <string>
  
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
| [akamai_edgeworker.edgeworker](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/edgeworker) | resource |
| [akamai_edgeworkers_activation.edgeworker](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/edgeworkers_activation) | resource |
| [null_resource.bundle](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | The group id that contains your cloudlet | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Edgeworker | `string` | n/a | yes |
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