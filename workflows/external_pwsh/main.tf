/**
* # External data from Powershell
*
* This code allows you to read in data from Akamai APIs which are not supported in Terraform, by use of the Akamai PowerShell module. The entire response from the function is made available as a json string under `data.external.<source_name>.result.json` and must be json-decoded for use. The script provided can be used for any supported Akamai PowerShell function (800+). All you need to do is add additional parameters to the `query` map as they are laid out in the function help.
*
* ## Requirements
*
* You must install PowerShell (v7+) and the accompanying `Akamai` module to use this script. PowerShell can be installed from [here](https://github.com/PowerShell/PowerShell/releases) and once installed you can install the Akamai module by running
* ```powershell
* Install-Module Akamai -Scope CurrentUser
* ```
*
* ## Authentication
*
* PowerShell functions all support the following 3 parameters:
* - EdgeRCFile - the location on disk of your EdgeRCFile. Defaults to ~/.edgerc
* - Section - The section in your EdgeRCFile to use. Defaults to 'default'
* - AccountSwitchKey - The account switch key, if your credential has access to more than one account.
*
* If you wish to use non-default values, these must be included in the query map to your external data source, but any can be omitted individually if the default value is fine.
*
* > Note: If you use `account_key` in your EdgeRC section you can simply specify the `Section` parameter and do not require `AccountSwitchKey` as well.
*/

locals {
  cidrs     = jsondecode(data.external.siteshield.result.json).currentCidrs
  hostnames = jsondecode(data.external.selectable_hostnames.result.json)
}

data "external" "siteshield" {
  program = ["pwsh", "-NoProfile", "${path.module}/external/tf-pwsh.ps1"]

  query = {
    Command    = "Get-SiteshieldMap"
    ID         = 1911348
    EdgeRCFile = var.edgerc_path
    Section    = var.config_section
  }
}

data "external" "selectable_hostnames" {
  program = ["pwsh", "-NoProfile", "${path.module}/external/tf-pwsh.ps1"]

  query = {
    Command    = "Get-AppSecSelectableHostnames"
    ConfigName = "smacleod"
    Version    = "latest"
    EdgeRCFile = var.edgerc_path
    Section    = var.config_section
  }
}

output "cidrs" {
  value = local.cidrs
}

output "hostnames" {
  value = local.hostnames
}
