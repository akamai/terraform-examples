/*
* # Phased Release Cloudlet Module
*
* This is a simple example of a shared phased release policy
*/
resource "akamai_cloudlets_policy" "policy" {
  name          = var.name
  cloudlet_code = var.cloudlet_code
  is_shared     = true
  description   = var.description
  group_id      = var.group_id
  #match_rule_format = "1.0"
  match_rules = data.akamai_cloudlets_phased_release_match_rule.match_rules_cd.json
}

resource "akamai_cloudlets_policy_activation" "policy_activation" {
  policy_id = tonumber(akamai_cloudlets_policy.policy.id)
  network   = var.env
  version   = akamai_cloudlets_policy.policy.version
}
