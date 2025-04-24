<!-- BEGIN_TF_DOCS -->

This module creates a Domain Validation certificate enrollment at Akamai
and sets up DNS with the validation records

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 admin_contact  = <object({
    first_name       = string
    last_name        = string
    organization     = string
    email            = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })>
  	 common_name  = <string>
  	 contract_id  = <string>
  	 organization  = <object({
    organization     = string
    unit             = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })>
  	 sans  = <list(string)>
  	 tech_contact  = <object({
    first_name       = string
    last_name        = string
    organization     = string
    email            = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })>
  
	 # Optional variables
  	 secure_network  = <string> | default: "standard-tls"
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
| [akamai_cps_dv_enrollment.enrollment](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cps_dv_enrollment) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_contact"></a> [admin\_contact](#input\_admin\_contact) | An object containing admin contact details for the certificate | <pre>object({<br/>    first_name       = string<br/>    last_name        = string<br/>    organization     = string<br/>    email            = string<br/>    phone            = string<br/>    address_line_one = string<br/>    address_line_two = string<br/>    city             = string<br/>    region           = string<br/>    postal_code      = string<br/>    country_code     = string<br/>  })</pre> | n/a | yes |
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | The common name on the certificate | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | The contract id that contains your certificate | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | An object containing organization details for the certificate | <pre>object({<br/>    organization     = string<br/>    unit             = string<br/>    phone            = string<br/>    address_line_one = string<br/>    address_line_two = string<br/>    city             = string<br/>    region           = string<br/>    postal_code      = string<br/>    country_code     = string<br/>  })</pre> | n/a | yes |
| <a name="input_sans"></a> [sans](#input\_sans) | A list of san names | `list(string)` | n/a | yes |
| <a name="input_tech_contact"></a> [tech\_contact](#input\_tech\_contact) | An object containing tech contact details for the certificate | <pre>object({<br/>    first_name       = string<br/>    last_name        = string<br/>    organization     = string<br/>    email            = string<br/>    phone            = string<br/>    address_line_one = string<br/>    address_line_two = string<br/>    city             = string<br/>    region           = string<br/>    postal_code      = string<br/>    country_code     = string<br/>  })</pre> | n/a | yes |
| <a name="input_secure_network"></a> [secure\_network](#input\_secure\_network) | The network to assign to. Can be either "standard-tls" or "enhanced-tls" | `string` | `"standard-tls"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_challenges"></a> [dns\_challenges](#output\_dns\_challenges) | n/a |
| <a name="output_enrollment_id"></a> [enrollment\_id](#output\_enrollment\_id) | n/a |
| <a name="output_hostnames"></a> [hostnames](#output\_hostnames) | n/a |
| <a name="output_http_challenges"></a> [http\_challenges](#output\_http\_challenges) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->