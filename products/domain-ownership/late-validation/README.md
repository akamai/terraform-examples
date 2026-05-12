<!-- BEGIN_TF_DOCS -->

# Domain Ownership Manager Late Validation Example

This module manages an Akamai property with multiple hostnames and automates the
DNS-based Domain Ownership Validation required for **DEFAULT DV (Secure by Default)**
certificate provisioning.

## Workflow

Everything can be applied in a **single `terraform apply`** run. Terraform's
dependency graph ensures the correct order of operations:

1. `akamai_property` is created and the `cert_status` ACME challenge data is
   populated automatically by the Akamai provider.
2. `akamai_dns_record` CNAME records are created for each `DEFAULT` hostname
   using the challenge values from `cert_status`.
3. `akamai_property_domainownership_late_validation` signals Akamai that the
   DNS records are in place, gating activation until validation passes.
4. `akamai_property_activation` proceeds once validation is complete.

## ⚠️ Domain Ownership Validation

For any hostname using `cert_provisioning_type = "DEFAULT"`, Akamai requires a
DNS CNAME record to prove domain ownership before issuing the certificate.
The required records are derived from the `cert_status` attribute on the
`akamai_property` resource and created automatically via `akamai_dns_record`.

The `akamai_property_domainownership_late_validation` resource **must complete
successfully before activation**, as it blocks activation until all DEFAULT
hostnames are validated. It depends on the DNS records being resolvable by
Akamai's validation infrastructure.

A subsequent `terraform apply --refresh-only` may be needed to update the state of the
`akamai_property` resource with the latest `cert_status` after validation completes.
This step only reconciles state and does not trigger any changes to infrastructure.

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
    cert_provisioning_type = string
  }))>
  	 property_name  = <string>
  
	 # Optional variables
  	 activation_network  = <string> | default: "STAGING"
  	 akamai_account_key  = <string> | default: ""
  	 contact  = <list(string)> | default: [
  "noreply@akamai.com"
]
  	 contract_id  = <string> | default: "ctr_1-5C13O8"
  	 enable_cert_validation  = <bool> | default: true
  	 group_id  = <string> | default: "grp_315963"
  	 product_id  = <string> | default: "prd_Fresca"
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
| [akamai_dns_record.cert_validation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/dns_record) | resource |
| [akamai_property.this](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property) | resource |
| [akamai_property_activation.activation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [akamai_property_domainownership_late_validation.this](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_domainownership_late_validation) | resource |
| [time_sleep.wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [akamai_property_rules_builder.rule_default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | Map of hostnames to their cert\_provisioning\_type. Key is cname\_from; cname\_to is derived as <hostname>.edgekey.net. | <pre>map(object({<br/>    cert_provisioning_type = string<br/>  }))</pre> | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | n/a | `string` | n/a | yes |
| <a name="input_activation_network"></a> [activation\_network](#input\_activation\_network) | n/a | `string` | `"STAGING"` | no |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_contact"></a> [contact](#input\_contact) | List of email addresses to notify on property activation. | `list(string)` | <pre>[<br/>  "noreply@akamai.com"<br/>]</pre> | no |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | n/a | `string` | `"ctr_1-5C13O8"` | no |
| <a name="input_enable_cert_validation"></a> [enable\_cert\_validation](#input\_enable\_cert\_validation) | n/a | `bool` | `true` | no |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | n/a | `string` | `"grp_315963"` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | n/a | `string` | `"prd_Fresca"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca_validation_hostnames"></a> [ca\_validation\_hostnames](#output\_ca\_validation\_hostnames) | Shows the list of hostnames to validate for CA certificates |
| <a name="output_ca_validation_record"></a> [ca\_validation\_record](#output\_ca\_validation\_record) | Shows the CA validation records for each hostname |
| <a name="output_hostnames"></a> [hostnames](#output\_hostnames) | Hostnames structure for demo purposes |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->