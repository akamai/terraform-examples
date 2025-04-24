This module will update DNS to CNAME the site to the edge hostname. It has a
precondition in place to check that the SBD certs are deployed before it will
allow this to happen. You should therefore wait ~8mins between updating the
properties with the new hostnames and  running this script. If the precondition
fails, you should wait a short while and try again

# Example
An example is shown below. Please refer to the example directory in this git repo for further details
```hcl
locals {
  property_name = "bucket-test10.example.org"
  edge_hostname = "bucket-test10.example.org.edgesuite.net"
  zone          = "example.org"
  hostnames     = ["bucket-test4.example.org", "bucket-test5.example.org"]
}

module "golive" {
  source        = "../modules/golive"
  hostnames     = local.hostnames
  property_name = local.property_name
  edge_hostname = local.edge_hostname
  zone          = local.zone
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_akamai"></a> [akamai](#provider\_akamai) | >= 7.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_edge_hostname"></a> [edge\_hostname](#input\_edge\_hostname) | Your Edge Hostname (without .edgesuite.net domain suffix) | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | A list of hostnames to include in this configuration | `list(string)` | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Name for your property | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The DNS zone that we're going live with | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_status"></a> [status](#output\_status) | n/a |
