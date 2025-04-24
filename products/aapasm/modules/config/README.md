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
| [akamai_appsec_advanced_settings_evasive_path_match.evasive_path_match](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_evasive_path_match) | resource |
| [akamai_appsec_advanced_settings_evasive_path_match.policy_evasive_path_match](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_evasive_path_match) | resource |
| [akamai_appsec_advanced_settings_logging.logging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_logging) | resource |
| [akamai_appsec_advanced_settings_pragma_header.pragma_header](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_pragma_header) | resource |
| [akamai_appsec_advanced_settings_prefetch.prefetch](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_prefetch) | resource |
| [akamai_appsec_api_constraints_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_api_constraints_protection) | resource |
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
| [akamai_appsec_match_target.match](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_match_target) | resource |
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
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000005](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000007](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000012](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000013](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000014](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000023](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000025](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000033](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000034](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000041](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000056](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000058](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000065](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000072](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000141](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000142](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000143](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000144](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000145](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000146](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000147](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000148](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000149](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000150](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000151](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000152](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000154](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000155](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000156](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000171](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000196](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_3000197](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_950002](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_950006](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_950011](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_959976](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_959977](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmd_injection_969151](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmdi_3000153](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackcmdi_3000195](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_3000120](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_3000121](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_3000122](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_3000123](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_3000124](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_3000125](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_3000126](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_3000127](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_950203](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacklfi_950204](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000109](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000132](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000133](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000134](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000135](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000136](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000139](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000166](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000167](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000168](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000179](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000183](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000184](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000185](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000186](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000187](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000188](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000189](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000190](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000191](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000198](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackplatform_3000199](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackpolicy_3000180](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackpolicy_950220](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackpolicy_961912](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_3000173](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_3000174](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_3000175](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_3000176](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_3000177](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_3000192](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_950216](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_951910](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_961011](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_961012](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_961034](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_961904](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackprotocol_968230](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackrfi_3000004](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackrfi_3000130](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackrfi_3000131](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackrfi_950118](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000000](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000006](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000015](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000017](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000022](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000100](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000101](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000102](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_3000103](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_950007](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_950902](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_959070](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_959073](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981240](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981242](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981243](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981244](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981247](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981248](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981251](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981252](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981253](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981254](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981255](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981256](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981260](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981270](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981276](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981300](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacksql_injection_981320](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000108](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000115](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000117](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000118](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000129](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000137](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000138](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000140](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000157](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000160](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000162](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_3000164](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_999002](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_999901](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attacktool_999902](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackwat_3000161](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000037](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000038](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000039](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000057](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000061](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000080](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000081](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000110](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000111](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000112](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000113](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000114](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000116](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000119](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_3000128](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_958003](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_958008](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_958023](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_958034](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_958051](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_958052](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_973305](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_973307](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_973311](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_973312](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_rule.policy_aseweb_attackxss_973335](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rule) | resource |
| [akamai_appsec_security_policy.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_security_policy) | resource |
| [akamai_appsec_selected_hostnames.hostnames](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_selected_hostnames) | resource |
| [akamai_appsec_siem_settings.siem](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_siem_settings) | resource |
| [akamai_appsec_slow_post.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_slow_post) | resource |
| [akamai_appsec_slowpost_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_slowpost_protection) | resource |
| [akamai_appsec_waf_mode.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_waf_mode) | resource |
| [akamai_appsec_waf_protection.policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_waf_protection) | resource |
| [akamai_botman_akamai_bot_category_action.default_academic_or_research_bots_0c508e1d-73a4-4366-9e48-3c4a080f1c5d](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_automated_shopping_cart_and_sniper_bots_75493431-b41a-492c-8324-f12158783ce1](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_business_intelligence_bots_8a70d29c-a491-4583-9768-7deea2f379c1](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_ecommerce_search_engine_bots_47bcfb70-f3f5-458b-8f7c-1773b14bc6a4](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_enterprise_data_aggregator_bots_50395ad2-2673-41a4-b317-9b70742fd40f](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_financial_account_aggregator_bots_c6692e03-d3a8-49b0-9566-5003eeaddbc1](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_financial_services_bots_53598904-21f5-46b1-8b51-1b991beef73b](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_job_search_engine_bots_2f169206-f32c-48f7-b281-d534cf1ceeb3](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_media_or_entertainment_search_bots_dff258d5-b1ad-4bbb-b1d1-cf8e700e5bba](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_news_aggregator_bots_ade03247-6519-4591-8458-9b7347004b63](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_online_advertising_bots_36b27e0c-76fc-44a4-b913-c598c5af8bba](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_rss_feed_reader_bots_b58c9929-9fd0-45f7-86f4-1d6259285c3c](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_seo_analytics_or_marketing_bots_f7558c03-9033-46ce-bbda-10eeda62a5d4](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_site_monitoring_and_web_development_bots_07782c03-8d21-4491-9078-b83514e6508f](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_social_media_or_blog_bots_7035af8d-148c-429a-89da-de41e68c72d8](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_web_archiver_bots_831ef84a-c2bb-4b0d-b90d-bcd16793b830](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_akamai_bot_category_action.default_web_search_engine_bots_4e14219f-6568-4c9d-9bd8-b29ca2afc422](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_akamai_bot_category_action) | resource |
| [akamai_botman_bot_detection_action.default_aggressive_web_crawlers_5bc041ad-c840-4202-9c2e-d7fc873dbeaf](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_browser_impersonator_a3b92f75-fa5d-436e-b066-426fc2919968](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_client_disabled_javascript_noscript_triggered_c5623efa-f326-41d1-9601-a2d201bedf63](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_cookie_integrity_failed_4f1fd3ea-7072-4cd0-8d12-24f275e6c75d](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_declared_bots_keyword_match_074df68e-fb28-432a-ac6d-7cfb958425f1](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_development_frameworks_da005ad3-8bbb-43c8-a783-d97d1fb71ad2](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_headless_browsersautomation_tools_b88cba13-4d11-46fe-a7e0-b47e78892dc4](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_http_libraries_578dad32-024b-48b4-930c-db81831686f4](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_impersonators_of_known_bots_fda1ffb9-ef46-4570-929c-7449c0c750f8](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_javascript_fingerprint_anomaly_393cba3d-656f-48f1-abe4-8dd5028c6871](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_javascript_fingerprint_not_received_c7f70f75-e3e2-4181-8ef8-30afb6576147](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_open_source_crawlersscraping_platforms_601192ae-f5e2-4a29-8f75-a0bcd3584c2b](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_session_validation_1bb748e2-b3ad-41db-85fa-c69e62be59dc](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_web_scraper_reputation_9712ab32-83bb-43ab-a46d-4c2a5a42e7e2](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_detection_action.default_web_services_libraries_872ed6c2-514c-4055-9c44-9782b1c783bf](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_detection_action) | resource |
| [akamai_botman_bot_management_settings.bot_management_settings](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_bot_management_settings) | resource |
| [akamai_botman_javascript_injection.javascript_injection](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/botman_javascript_injection) | resource |

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