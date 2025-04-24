# Authentication Scripts

The scripts in this directory are intended to be used for local testing of Terraform code which expects Akamai API credentials in the form of
environment variables. Both the PowerShell and Bash scripts perform the same job, so which you pick largely depends on your preference, but it
is assumed that Windows users will use PowerShell, and Unix platform users (Mac, Linux, WSL etc.) Bash.

Both scripts will set _ephemeral_ variables, i.e. when your shell is closed the variables will be cleared. They do not persist.

## PowerShell

```powershell
NAME
    C:\code\terraform-examples\tools\authentication\Set-TerraformEnvironmentVariables.ps1

SYNOPSIS
    Set Akamai authentication environment variables for Terraform

SYNTAX
    C:\code\terraform-examples\tools\authentication\Set-TerraformEnvironmentVariables.ps1 [[-EdgeRCFile] <String>] [[-Section] <String>] [[-AccountSwitchKey] <String>]
    [<CommonParameters>]

DESCRIPTION
    Reads a given EdgeRC file and Section and sets Terraform environment variables

PARAMETERS
    -EdgeRCFile <String>
        EdgeRC file path. Defaults to '~/.edgerc'

    -Section <String>
        EdgeRC section. Defaults to 'default'

    -AccountSwitchKey <String>
        Account switch key

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216).

    -------------------------- EXAMPLE 1 --------------------------

    PS > # Use default EdgeRC (~/.edgerc) and Section (default)
    > .\Set-TerraformEnvironmentVariables.ps1

    -------------------------- EXAMPLE 2 --------------------------

    PS > # Specify all parameters
    > .\Set-TerraformEnvironmentVariables.ps1 -EdgeRCFile c:\path\to\edgerc -Section MySection -AccountSwitchKey 1-2AB34C
```

## Bash

In order for the variables set by this script to be available to your Terraform process it must be run in the same shell, and use either dot-source or
the `source` command.

> Note: if you run the script directly from the shell it will set environment variables in child processes, which will be immediately cleared.

**Usage**:

```shell
source ./set_terraform_environment_variables.sh [-e|--edgerc /path/to/edgerc] [-s|--section sectionheader] [-a|--accountSwitchKey 1-2AB34C]
```

**Parameters**

- -e|--edgerc - Location of EdgeRC file. Defaults to ~/.edgerc
- -s|--section - Section in your EdgeRC file. Defaults to 'default'
- -a|--accountSwitchKey - Account Switch Key. Only applicable to those users whose API clients have access to multiple accounts, e.g. Akamai staff.

**Examples**

```shell
# Use default EdgeRC (~/.edgerc) and Section (default)
source ./set_terraform_environment_variables.sh
```

```shell
# Specify all parameters
source ./set_terraform_environment_variables.sh -e /path/to/edgerc -s MySection -a 1-2AB34C
```

