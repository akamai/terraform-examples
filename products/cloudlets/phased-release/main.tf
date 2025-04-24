/*
* # Phased Release Cloudlet Module
*
* This is a simple example of a shared phased release policy
*/
resource "akamai_cloudlets_policy" "policy" {
  name              = "pr_bluegreen"
  cloudlet_code     = "CD"
  is_shared         = true
  description       = "Change Notes"
  group_id          = "91533"
  match_rule_format = "1.0"
  match_rules       = data.akamai_cloudlets_phased_release_match_rule.match_rules_cd.json
}

# Note, the "associated_properties" field below is not required for shared policies
resource "akamai_cloudlets_policy_activation" "policy_activation" {
  policy_id = tonumber(akamai_cloudlets_policy.policy.id)
  network   = var.env
  version   = akamai_cloudlets_policy.policy.version
  #associated_properties = ["prtest"]
}
