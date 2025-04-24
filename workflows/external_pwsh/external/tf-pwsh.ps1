<#
.SYNOPSIS
Make Akamai API call with terraform external data source
.DESCRIPTION
Takes in a json string which, when converted to a hashtable should be command name plus all necessary params
#>

process {
    ## Validate input
    if ($null -eq $Input) {
        Write-Error 'Input to PowerShell function is null. Please check query map exists'
        exit 1
    }
    try {
        $Parameters = $Input | ConvertFrom-Json -AsHashtable
    }
    catch {
        Write-Error 'Either query cannot be converted from JSON'
        exit 1
    }

    ## Extract command from map and remove
    $Command = $Parameters['Command']
    if ($null -eq $Command) {
        Write-Error "Command missing from input map"
        exit 1
    }
    $Parameters.Remove('Command')
    
    ## Make Akamai call with splatted params
    try {
        $Result = Invoke-Expression "$Command @Parameters"
    }
    catch {
        Write-Error $_.ErrorDetails.Message
        exit 1
    }
    
    ## Check result is not null
    if ($null -eq $Result) {
        Write-Error "Object not found"
        exit 1
    }
    
    ## Convert API request to JSON
    try {
        $ResultJSON = ConvertTo-Json -InputObject $Result -Depth 100 | ConvertTo-Json
    }
    catch {
        Write-Error "Could not convert API response to JSON"
        exit 1
    }
      
    ## Remove carriage returns
    $ResultJSON = $ResultJSON.replace("\r", "")
    ## Wrap output in top-level json member
    $Output = @"
{ "json": $ResultJSON }
"@
    ## Return output back to Terraform
    return $Output
}