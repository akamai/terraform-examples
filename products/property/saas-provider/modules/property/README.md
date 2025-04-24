<!-- BEGIN_TF_DOCS -->

# Property Manager: SaaS Provider

This modules shows a use-case where a SaaS provider will have a single property for
their application and customer hostnames get added on an adhoc basis. This module will
create the Property Manager configuration, add the list of hostnames to it, and return
a map of challenges for validating the certificate for each hostname. The map key is
the acme challenge "hostname" and the value is the "target".

This modules deliberately does not activate the Property Manager configuration to
production because it's likely you're going to want to delay that until the certificate
has deployed

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 contacts  = <list(string)>
  	 contract_id  = <string>
  	 edge_hostname  = <string>
  	 group_id  = <string>
  	 hostnames  = <list(string)>
  	 property_name  = <string>
  
	 # Optional variables
  	 compliance_record  = <object({
    reason           = string
    peer_reviewed_by = optional(string)
    customer_email   = optional(string)
    unit_tested      = optional(bool)
  })> | default: null
  	 product_id  = <string> | default: "prd_Fresca"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | >= 7.0.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_cp_code.default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/cp_code) | resource |
| [akamai_edge_hostname.edgehostname_edgesuite_net](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/edge_hostname) | resource |
| [akamai_property.saas_config](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property) | resource |
| [akamai_property_activation.saas_config-production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [akamai_property_activation.saas_config-staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [akamai_property_rules_builder.saas_config_rule_accelerate_delivery](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_adaptive_acceleration](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_allowed_methods](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_augment_insights](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_bots](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_compressible_objects](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_css_and_java_script](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_default](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_delete](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_files](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_fonts](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_geolocation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_graph_ql](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_hsts](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_html_pages](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_images](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_increase_availability](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_log_delivery](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_m_pulse_rum](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_minimize_payload](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_obfuscate_backend_info](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_obfuscate_debug_info](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_offload_origin](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_options](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_origin_connectivity](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_origin_health](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_other_static_objects](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_patch](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_post](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_post_responses](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_prefetchable_objects](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_prefetching](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_prefetching_objects](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_protocol_optimizations](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_put](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_redirects](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_script_management](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_simulate_failover](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_site_failover](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_strengthen_security](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_traffic_reporting](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.saas_config_rule_uncacheable_objects](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/property_rules_builder) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contacts"></a> [contacts](#input\_contacts) | A list of contacts who will be contacted when this config is deployed | `list(string)` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Contract ID | `string` | n/a | yes |
| <a name="input_edge_hostname"></a> [edge\_hostname](#input\_edge\_hostname) | Your Edge Hostname (without .edgesuite.net domain suffix) | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Group ID | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | A list of hostnames to include in this configuration | `list(string)` | n/a | yes |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Name for your property | `string` | n/a | yes |
| <a name="input_compliance_record"></a> [compliance\_record](#input\_compliance\_record) | For Akamai internal change management process | <pre>object({<br/>    reason           = string<br/>    peer_reviewed_by = optional(string)<br/>    customer_email   = optional(string)<br/>    unit_tested      = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Name of the required product | `string` | `"prd_Fresca"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_challenges"></a> [challenges](#output\_challenges) | A list of DNS CNAME domain validation challenges where each entry is an object that contains "hostname" and "target" |
| <a name="output_hostnames"></a> [hostnames](#output\_hostnames) | The hostnames that were passed to us when we created these properties |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->