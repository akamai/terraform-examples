This is defines the centrally managed property. This will attach each PM Include within
its rule tree. It's managed separately from the microservices includes and has its own
state file. It obtains the ids of the attached includes via a remote state datasource
This allows the individual microservices development teams to manage their own includes
without having to share state with this centrally managed property

## Providers

| Name | Version |
|------|---------|
| <a name="provider_akamai"></a> [akamai](#provider\_akamai) | >= 7.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contacts"></a> [contacts](#input\_contacts) | A list of contacts who will be contacted when this config is deployed | `list(string)` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | n/a | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | n/a | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | The hostnames to include on this property | `list(string)` | n/a | yes |
| <a name="input_includes"></a> [includes](#input\_includes) | A map that maps include ids to a list of path matches | `map(list(string))` | n/a | yes |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Name of the required product | `string` | `"prd_Fresca"` | no |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Name for your property | `string` | n/a | yes |

## Outputs

No outputs.
