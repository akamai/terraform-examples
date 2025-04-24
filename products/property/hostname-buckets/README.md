<!-- BEGIN_TF_DOCS -->

This modules shows a use-case where a customer can use hostname buckets and default
certificates to manage thousands of hostnames on a delivery property. It will return
a map of challenges for validating the certificate for each hostname. The map key is
the acme challenge "hostname" and the value is the "target".

# Example
An example is shown below. Please refer to the example directory in this git repo for further details
```hcl
locals {
  property_name = "bucket-test10.example.org"
  zone          = "example.org"
  contacts      = ["ian@example.org"]
  contract_id   = "ctr_1-1NC95D"
  group_id      = "grp_91533"
  hostnames     = ["bucket-test4.example.org", "bucket-test5.example.org"]
}

module "delivery" {
  source        = "../modules/property"
  contract_id   = local.contract_id
  group_id      = local.group_id
  property_name = local.property_name
  hostnames     = local.hostnames
  contacts      = local.contacts
}

module "dns" {
  source     = "../modules/dns"
  zone       = local.zone
  hostnames  = module.delivery.hostnames
  challenges = module.delivery.challenges
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
| <a name="module_delivery"></a> [delivery](#module\_delivery) | ../modules/property | n/a |
| <a name="module_dns"></a> [dns](#module\_dns) | ../modules/dns | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_challenges"></a> [challenges](#input\_challenges) | A map of challenge hostnames to their CNAME targets | `map(string)` | n/a | yes |
| <a name="input_contacts"></a> [contacts](#input\_contacts) | A list of contacts who will be contacted when this config is deployed | `list(string)` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | A list of hostnames to create challenges for. Unfortunately this is needed because Terraform wants to know how many records it's creating at plan time and challenges map isn't know until run time | `list(string)` | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Name for your property | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The DNS zone that we're adding the challenge records | `string` | n/a | yes |
| <a name="input_compliance_record"></a> [compliance\_record](#input\_compliance\_record) | For Akamai internal change management process | <pre>object({<br/>    reason           = string<br/>    peer_reviewed_by = optional(string)<br/>    customer_email   = optional(string)<br/>    unit_tested      = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_notes"></a> [notes](#input\_notes) | Change notes for the bucket activation | `string` | `"Updated by Terraform"` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Name of the required product | `string` | `"prd_Fresca"` | no |

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