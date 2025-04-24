<!-- BEGIN_TF_DOCS -->



# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 config_description  = <string>
  	 config_name  = <string>
  	 contract_id  = <string>
  	 geo_block_list_id  = <string>
  	 group_id  = <string>
  	 hostnames  = <list(string)>
  	 ip_block_list_exceptions_id  = <string>
  	 ip_block_list_id  = <string>
  	 notes  = <string>
  	 pragma_exceptions_id  = <string>
  	 rate_bypass_list_id  = <string>
  	 security_bypass_list_id  = <string>
  
	 # Optional variables
  	 enable_client_rep  = <bool> | default: true
  	 enable_siem  = <bool> | default: true
  	 enable_slow_post  = <bool> | default: true
  	 policy_name  = <string> | default: "default"
  	 policy_prefix  = <string> | default: "DEF1"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 7.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_appsec_advanced_settings_attack_payload_logging.attack_payload_logging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_attack_payload_logging) | resource |
| [akamai_appsec_advanced_settings_logging.logging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_logging) | resource |
| [akamai_appsec_advanced_settings_pii_learning.pii_learning](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_pii_learning) | resource |
| [akamai_appsec_advanced_settings_pragma_header.pragma_header](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_pragma_header) | resource |
| [akamai_appsec_advanced_settings_request_body.config_settings](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_request_body) | resource |
| [akamai_appsec_attack_group.policy_CMD](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.policy_LFI](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.policy_PLATFORM](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.policy_POLICY](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.policy_PROTOCOL](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.policy_RFI](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.policy_SQL](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.policy_WAT](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.policy_XSS](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_configuration.config](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_configuration) | resource |
| [akamai_appsec_ip_geo.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_ip_geo) | resource |
| [akamai_appsec_ip_geo_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_ip_geo_protection) | resource |
| [akamai_appsec_malware_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_malware_protection) | resource |
| [akamai_appsec_penalty_box.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_penalty_box) | resource |
| [akamai_appsec_rate_policy.forward_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy.origin_error](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy.page_view_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy.post_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy_action.policy_forward_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_policy_action.policy_origin-error](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_policy_action.policy_page_view_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_policy_action.policy_post_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_protection) | resource |
| [akamai_appsec_reputation_profile.dos_attackers_high_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.dos_attackers_high_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.dos_attackers_low_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.dos_attackers_low_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.scanning_tools_high_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.scanning_tools_high_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.scanning_tools_low_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.scanning_tools_low_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.web_attackers_high_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.web_attackers_high_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.web_attackers_low_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.web_attackers_low_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.web_scrapers_high_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.web_scrapers_high_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.web_scrapers_low_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile.web_scrapers_low_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile) | resource |
| [akamai_appsec_reputation_profile_action.policy_dos_attackers_high_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_dos_attackers_high_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_dos_attackers_low_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_dos_attackers_low_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_scanning_tools_high_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_scanning_tools_high_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_scanning_tools_low_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_scanning_tools_low_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_web_attackers_high_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_web_attackers_high_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_web_attackers_low_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_web_attackers_low_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_web_scrapers_high_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_web_scrapers_high_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_web_scrapers_low_threat_non_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_profile_action.policy_web_scrapers_low_threat_shared](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_profile_action) | resource |
| [akamai_appsec_reputation_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_reputation_protection) | resource |
| [akamai_appsec_security_policy.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_security_policy) | resource |
| [akamai_appsec_siem_settings.siem](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_siem_settings) | resource |
| [akamai_appsec_slow_post.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_slow_post) | resource |
| [akamai_appsec_slowpost_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_slowpost_protection) | resource |
| [akamai_appsec_waf_mode.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_waf_mode) | resource |
| [akamai_appsec_waf_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_waf_protection) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_description"></a> [config\_description](#input\_config\_description) | n/a | `string` | n/a | yes |
| <a name="input_config_name"></a> [config\_name](#input\_config\_name) | n/a | `string` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | n/a | `string` | n/a | yes |
| <a name="input_geo_block_list_id"></a> [geo\_block\_list\_id](#input\_geo\_block\_list\_id) | Geo Block List Geos Network List ID | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | n/a | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | n/a | `list(string)` | n/a | yes |
| <a name="input_ip_block_list_exceptions_id"></a> [ip\_block\_list\_exceptions\_id](#input\_ip\_block\_list\_exceptions\_id) | IP Block List Exceptions IPs Network List ID | `string` | n/a | yes |
| <a name="input_ip_block_list_id"></a> [ip\_block\_list\_id](#input\_ip\_block\_list\_id) | IP Block List IPs Network List ID | `string` | n/a | yes |
| <a name="input_notes"></a> [notes](#input\_notes) | Execution notes, used to update certain elements | `string` | n/a | yes |
| <a name="input_pragma_exceptions_id"></a> [pragma\_exceptions\_id](#input\_pragma\_exceptions\_id) | Pragma Removal Exceptions IPs Network List ID | `string` | n/a | yes |
| <a name="input_rate_bypass_list_id"></a> [rate\_bypass\_list\_id](#input\_rate\_bypass\_list\_id) | Rate Control Bypass List IPs Network List ID | `string` | n/a | yes |
| <a name="input_security_bypass_list_id"></a> [security\_bypass\_list\_id](#input\_security\_bypass\_list\_id) | Security Bypass List IPs Network List ID | `string` | n/a | yes |
| <a name="input_enable_client_rep"></a> [enable\_client\_rep](#input\_enable\_client\_rep) | On/Off option for Client Reputation feature | `bool` | `true` | no |
| <a name="input_enable_siem"></a> [enable\_siem](#input\_enable\_siem) | On/Off option for SIEM feature | `bool` | `true` | no |
| <a name="input_enable_slow_post"></a> [enable\_slow\_post](#input\_enable\_slow\_post) | On/Off option for Slow Post feature | `bool` | `true` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | n/a | `string` | `"default"` | no |
| <a name="input_policy_prefix"></a> [policy\_prefix](#input\_policy\_prefix) | n/a | `string` | `"DEF1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_id"></a> [config\_id](#output\_config\_id) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->