<!-- BEGIN_TF_DOCS -->

# Edge Redirector Module driven by CSV

This Terraform module implements an Edge Redirector policy with its
input as a csv file similar to one that you'd download from the Akamai
Control Centre GUI

# Example
An example is shown below. Please refer to the example directory in this git repo for further details
```hcl
module "example" {
  source                = "../modules/er"
  csv                   = file("redirects.csv")
  group_id              = "19293"
  policy_name           = "ertest_tf"
  associated_properties = ["test.example.org", "test2.example.org"]
  #env = "production"
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
| <a name="module_example"></a> [example](#module\_example) | ../modules/er | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access token | `string` | n/a | yes |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client secret | `string` | n/a | yes |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client token | `string` | n/a | yes |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host | `string` | n/a | yes |
| <a name="input_associated_properties"></a> [associated\_properties](#input\_associated\_properties) | The properties that are associated with this cloudlet policy | `list(string)` | n/a | yes |
| <a name="input_csv"></a> [csv](#input\_csv) | The CSV file is similar to one that you'd download from Control Center GUI and should have the following headings:-<pre>ruleName,matchURL,useRelativeUrl,redirectURL,statusCode</pre>In addition, it should be passed to the module as follows:-<pre>csv = file(\"redirects.csv\")</pre> | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | The group id that contains your cloudlet | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name of the cloudlet policy | `string` | n/a | yes |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai account key (optional) | `string` | `""` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to which this should be deployed | `string` | `"staging"` | no |

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