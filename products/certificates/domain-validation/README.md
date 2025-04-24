<!-- BEGIN_TF_DOCS -->

This module creates a Domain Validation certificate enrollment at Akamai
and sets up DNS with the validation records

# Example
An example is shown below. Please refer to the example directory in this git repo for further details
```hcl
locals {
  contact_details = {
    first_name       = "Alice"
    last_name        = "Smith"
    organization     = "Example Ltd"
    unit             = "Tech Dept"
    email            = "alice@example.com"
    phone            = "+447700900123"
    address_line_one = "123 Test Street"
    address_line_two = "Suite 456"
    city             = "Testville"
    region           = "Testshire"
    postal_code      = "TST123"
    country_code     = "GB"
  }
  contract_id = "ctr_1-1NC95D"
  common_name = "test999.example.org"
  sans        = ["test998.example.org"]

}

module "enrollment" {
  source        = "../modules/enrollment"
  contract_id   = local.contract_id
  common_name   = local.common_name
  sans          = local.sans
  admin_contact = local.contact_details
  tech_contact  = merge(local.contact_details, { email = "example@example.org" }) # Override the tech contact
  organization  = local.contact_details
}

module "dns" {
  source     = "../modules/dns"
  zone       = "example.org"
  challenges = module.enrollment.dns_challenges
  hostnames  = module.enrollment.hostnames
}

module "validation" {
  source        = "../modules/validation"
  enrollment_id = module.enrollment.enrollment_id
  hostnames     = module.dns.hostnames
}

output "dns_challenges" {
  value = module.enrollment.dns_challenges
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
| <a name="module_dns"></a> [dns](#module\_dns) | ../modules/dns | n/a |
| <a name="module_enrollment"></a> [enrollment](#module\_enrollment) | ../modules/enrollment | n/a |
| <a name="module_validation"></a> [validation](#module\_validation) | ../modules/validation | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_challenges"></a> [dns\_challenges](#output\_dns\_challenges) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->