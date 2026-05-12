/*

This file provides you with two options on how to authenticate to Akamai APIs: either with environment variables or with a .edgerc file.
The option for environment variables is assumed to be the default, so is left uncommented. If you wish to use a .edgerc file, uncomment
the lines below, but make sure to comment out the environment variables section. If you leave both options uncommented, Terraform will error.

> Note: If you are using the code in this directory inside a module, neither option is required and you should delete this file.

- Environment variables

In this option we use Terraform variables containing the four key elements of your Akamai API credential: host, access token, client token
and client secret. There is also support for a fifth option, account_key, which can be used if you have access to multiple accounts and
your API client has account switching capability.

In order to connect the terraform variables to environment variables, you need to create environment variables of the format 

TF_VAR_<variable>

For example, in order for Terraform to assign the value of `akamai_host` from an environment variable, create a variable named

TF_VAR_akamai_host

Remember: case-sensitivity applies, even on Windows, so make sure your environment variables are set up correctly.

> In order to help with local testing, scripts to read an .edgerc file and populate the relevant environment variables have been provided in 
this repo, in the tools/authentication directory.

*/

provider "akamai" {
  config {
    client_secret = var.akamai_client_secret
    host          = var.akamai_host
    access_token  = var.akamai_access_token
    client_token  = var.akamai_client_token
    account_key   = var.akamai_account_key
  }
}

variable "akamai_client_secret" {
  type        = string
  description = "Akamai client secret"
}
variable "akamai_host" {
  type        = string
  description = "Akamai host"
}
variable "akamai_access_token" {
  type        = string
  description = "Akamai access token"
}
variable "akamai_client_token" {
  type        = string
  description = "Akamai client token"
}
variable "akamai_account_key" {
  type        = string
  description = "Akamai account key (optional)"
  default     = ""
}


/*

- EdgeRC File

In order to use this method you must create a .edgerc file inline with the information here: 

https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials

Once you have done so, comment out the environment variables section above, and uncomment the settings below.

*/

# provider "akamai" {
#   edgerc         = var.edgerc_path
#   config_section = var.config_section
# }

# variable "edgerc_path" {
#   type        = string
#   default     = "~/.edgerc"
#   description = "Path to .edgerc file. Defaults to ~/.edgerc"
# }

# variable "config_section" {
#   type        = string
#   default     = "default"
#   description = "EdgeRC section. Change this to switch between accounts, assuming your section has an account_id member"
# }
