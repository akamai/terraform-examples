<#
.SYNOPSIS
Set Akamai authentication environment variables for Terraform
.DESCRIPTION
Reads a given EdgeRC file and Section and sets Terraform environment variables
.NOTES
Date: 25/03/2025
Version: 1 - Initial
.PARAMETER EdgeRCFile
EdgeRC file path. Defaults to '~/.edgerc'
.PARAMETER Section
EdgeRC section. Defaults to 'default'
.PARAMETER AccountSwitchKey
Account switch key
.EXAMPLE
# Use default EdgeRC (~/.edgerc) and Section (default)
> .\Set-TerraformEnvironmentVariables.ps1
.EXAMPLE
# Specify all parameters
> .\Set-TerraformEnvironmentVariables.ps1 -EdgeRCFile c:\path\to\edgerc -Section MySection -AccountSwitchKey 1-2AB34C
#>
Param(   
    [Parameter()]
    [string]
    $EdgeRCFile = "~/.edgerc",

    [Parameter()]
    [string]
    $Section = "default",

    [Parameter()]
    [string]
    $AccountSwitchKey
)

if (-not (Test-Path $EdgeRCFile)) {
    Write-Error "EdgeRC file '$EdgeRCFile' cannot be found."
    return
}

$EdgeRCContent = Get-Content $EdgeRCFile

if (-not $EdgeRCContent.Contains("[$Section]")) {
    Write-Error "EdgeRC file '$EdgeRCFile' does not contain a section name '$Section'"
    return
}

$Auth = @{}
foreach ($line in $EdgeRCContent) {
    $SanitizedLine = $line.Replace(" ", "")

    ## Set SectionHeader variable if line is a header.
    if ($SanitizedLine.contains("[") -and $SanitizedLine.contains("]")) {
        $SectionHeader = $SanitizedLine.Substring($SanitizedLine.indexOf('[') + 1)
        $SectionHeader = $SectionHeader.SubString(0, $SectionHeader.IndexOf(']'))
    }

    ## Skip sections other than desired one
    if ($SectionHeader -ne $Section) { continue }

    if ($SanitizedLine.ToLower().StartsWith("client_token")) { $Auth.client_token = $SanitizedLine.SubString($SanitizedLine.IndexOf("=") + 1) }
    if ($SanitizedLine.ToLower().StartsWith("access_token")) { $Auth.access_token = $SanitizedLine.SubString($SanitizedLine.IndexOf("=") + 1) }
    if ($SanitizedLine.ToLower().StartsWith("host")) { $Auth.host = $SanitizedLine.SubString($SanitizedLine.IndexOf("=") + 1) }
    if ($SanitizedLine.ToLower().StartsWith("client_secret")) { $Auth.client_secret = $SanitizedLine.SubString($SanitizedLine.IndexOf("=") + 1) }
    if ($SanitizedLine.ToLower().StartsWith("account_key")) { $Auth.account_key = $SanitizedLine.SubString($SanitizedLine.IndexOf("=") + 1) }
}

if (-not $Auth.access_token -or -not $Auth.client_token -or -not $Auth.host -or -not $Auth.client_secret) {
    Write-Error "Section '$Section' of EdgeRC file '$EdgeRCFile' is missing one of: host, access_token, client_token, client_secret"
    return
}

$env:TF_VAR_akamai_access_token = $Auth.access_token
$env:TF_VAR_akamai_client_token = $Auth.client_token
$env:TF_VAR_akamai_client_secret = $Auth.client_secret
$env:TF_VAR_akamai_host = $Auth.host
$env:TF_VAR_akamai_account_key = $AccountSwitchKey

Write-Host -ForegroundColor Green "Terraform environment variables set"