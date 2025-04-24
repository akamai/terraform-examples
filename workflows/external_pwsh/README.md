# External data from Powershell

This code allows you to read in data from Akamai APIs which are not supported in Terraform, by use of the Akamai PowerShell module. The entire response from the function is made available as a json string under `data.external.<source_name>.result.json` and must be json-decoded for use. The script provided can be used for any supported Akamai PowerShell function (800+). All you need to do is add additional parameters to the `query` map as they are laid out in the function help.

## Requirements

You must install PowerShell (v7+) and the accompanying `Akamai` module to use this script. PowerShell can be installed from [here](https://github.com/PowerShell/PowerShell/releases) and once installed you can install the Akamai module by running
```powershell
Install-Module Akamai -Scope CurrentUser
```

## Authentication

PowerShell functions all support the following 3 parameters:
- EdgeRCFile - the location on disk of your EdgeRCFile. Defaults to ~/.edgerc
- Section - The section in your EdgeRCFile to use. Defaults to 'default'
- AccountSwitchKey - The account switch key, if your credential has access to more than one account.

If you wish to use non-default values, these must be included in the query map to your external data source, but any can be omitted individually if the default value is fine.

> Note: If you use `account_key` in your EdgeRC section you can simply specify the `Section` parameter and do not require `AccountSwitchKey` as well.
<!-- BEGIN_TF_DOCS -->

# External data from Powershell

This code allows you to read in data from Akamai APIs which are not supported in Terraform, by use of the Akamai PowerShell module. The entire response from the function is made available as a json string under `data.external.<source_name>.result.json` and must be json-decoded for use. The script provided can be used for any supported Akamai PowerShell function (800+). All you need to do is add additional parameters to the `query` map as they are laid out in the function help.

## Requirements

You must install PowerShell (v7+) and the accompanying `Akamai` module to use this script. PowerShell can be installed from [here](https://github.com/PowerShell/PowerShell/releases) and once installed you can install the Akamai module by running
```powershell
Install-Module Akamai -Scope CurrentUser
```

## Authentication

PowerShell functions all support the following 3 parameters:
- EdgeRCFile - the location on disk of your EdgeRCFile. Defaults to ~/.edgerc
- Section - The section in your EdgeRCFile to use. Defaults to 'default'
- AccountSwitchKey - The account switch key, if your credential has access to more than one account.

If you wish to use non-default values, these must be included in the query map to your external data source, but any can be omitted individually if the default value is fine.

> Note: If you use `account_key` in your EdgeRC section you can simply specify the `Section` parameter and do not require `AccountSwitchKey` as well.

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Optional variables
  	 config_section  = <string> | default: "terraform-ps"
  	 edgerc_path  = <string> | default: "~/.edgerc"
}
 ```

## Requirements

No requirements.

## Resources

| Name | Type |
|------|------|
| [external_external.selectable_hostnames](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.siteshield](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_section"></a> [config\_section](#input\_config\_section) | n/a | `string` | `"terraform-ps"` | no |
| <a name="input_edgerc_path"></a> [edgerc\_path](#input\_edgerc\_path) | n/a | `string` | `"~/.edgerc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cidrs"></a> [cidrs](#output\_cidrs) | n/a |
| <a name="output_hostnames"></a> [hostnames](#output\_hostnames) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->