<!-- BEGIN_TF_DOCS -->

# Third Party Certificate Enrollment

This module creates a third party certificate enrollment at Akamai, passes
the CSR to your ACME provider, validates, and passes the signed cert back
to Akamai for deployment onto the platform. Note, this module should be
updated to configure acme.tf according to your provider settings. This is
not a runtime configurable that's defined by input variables

# Example
An example is shown below. Please refer to the example directory in this git repo for further details
```hcl
locals {
  contact_details = {
    first_name       = "Alice"
    last_name        = "Smith"
    organization     = "Example Ltd"
    unit             = "Tech Dept"
    email            = "alice.smith@example.org"
    phone            = "+447700900123"
    address_line_one = "123 Test Street"
    address_line_two = "Suite 456"
    city             = "Testville"
    region           = "Testshire"
    postal_code      = "TST123"
    country_code     = "GB"
  }
}

module "example" {
  source        = "../modules/third-party"
  contract_id   = "AK12345"
  common_name   = "www.example.org"
  sans          = ["www.example.com", "www.example.net"]
  tech_contact  = local.contact_details
  admin_contact = local.contact_details
  organization  = local.contact_details
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 7.0 |

## Resources

No resources.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_example"></a> [example](#module\_example) | ../modules/third-party | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_contact"></a> [admin\_contact](#input\_admin\_contact) | An object containing admin contact details for the certificate | <pre>object({<br/>    first_name       = string<br/>    last_name        = string<br/>    organization     = string<br/>    email            = string<br/>    phone            = string<br/>    address_line_one = string<br/>    address_line_two = string<br/>    city             = string<br/>    region           = string<br/>    postal_code      = string<br/>    country_code     = string<br/>  })</pre> | n/a | yes |
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | The common name on the certificate | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | The contract id that contains your certificate | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | An object containing organization details for the certificate | <pre>object({<br/>    organization     = string<br/>    unit             = string<br/>    phone            = string<br/>    address_line_one = string<br/>    address_line_two = string<br/>    city             = string<br/>    region           = string<br/>    postal_code      = string<br/>    country_code     = string<br/>  })</pre> | n/a | yes |
| <a name="input_sans"></a> [sans](#input\_sans) | A list of san names | `list(string)` | n/a | yes |
| <a name="input_tech_contact"></a> [tech\_contact](#input\_tech\_contact) | An object containing tech contact details for the certificate | <pre>object({<br/>    first_name       = string<br/>    last_name        = string<br/>    organization     = string<br/>    email            = string<br/>    phone            = string<br/>    address_line_one = string<br/>    address_line_two = string<br/>    city             = string<br/>    region           = string<br/>    postal_code      = string<br/>    country_code     = string<br/>  })</pre> | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_secure_network"></a> [secure\_network](#input\_secure\_network) | The network to assign to. Can be either "standard-tls" or "enhanced-tls" | `string` | `"standard-tls"` | no |

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