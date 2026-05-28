<!-- BEGIN_TF_DOCS -->

# Domain Ownership Manager Pre-Validation Example

This module registers domains with Akamai's Domain Ownership Manager and automates
DNS-based validation **before** any property or certificate provisioning takes place.

## Workflow

Resources must be applied in two steps due to the dependency on DNS propagation:

1. `akamai_property_domainownership_domains` registers each domain and returns the
   DNS challenge data (CNAME record name and target).
2. `akamai_dns_record` creates a CNAME record per domain using the challenge values.
3. `time_sleep` waits for DNS propagation so Akamai's infrastructure can resolve
   the records before validation is triggered.
4. `akamai_property_domainownership_validation` signals Akamai to perform the
   validation check, completing the pre-validation flow.

## ⚠️ Domain Ownership Validation

Each domain is registered and validated independently. `for_each` is used on all
resources so that adding or removing a single domain only affects that domain's
state objects, leaving all other domains untouched.

The DNS CNAME challenge records must be resolvable by Akamai's validation
infrastructure before `akamai_property_domainownership_validation` is invoked.
The `time_sleep` resource provides a buffer for propagation; adjust
`create_duration` if validation fails due to DNS not yet being visible.

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
  	 hostnames  = <map(object({
    validation_scope = string
  }))>
  
	 # Optional variables
  	 akamai_account_key  = <string> | default: ""
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 10.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.13 |

## Resources

| Name | Type |
|------|------|
| [akamai_dns_record.cname_validation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_property_domainownership_domains.dom_domains](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_domainownership_domains) | resource |
| [akamai_property_domainownership_validation.jaescalo-online](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_domainownership_validation) | resource |
| [time_sleep.wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | Map of hostnames to their validation\_scope. Key is domain\_name. | <pre>map(object({<br/>    validation_scope = string<br/>  }))</pre> | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_challenges"></a> [challenges](#output\_challenges) | n/a |
| <a name="output_txt_records"></a> [txt\_records](#output\_txt\_records) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->