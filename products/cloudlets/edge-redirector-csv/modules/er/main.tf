/*
* # Edge Redirector Module driven by CSV
* 
* This Terraform module implements an Edge Redirector policy with its 
* input as a csv file similar to one that you'd download from the Akamai 
* Control Centre GUI
*
*/

resource "akamai_cloudlets_policy" "policy" {
  name              = var.policy_name
  cloudlet_code     = "ER"
  description       = "Created by Terraform"
  group_id          = var.group_id
  match_rule_format = "1.0"
  match_rules       = data.akamai_cloudlets_edge_redirector_match_rule.match_rules_er.json
  is_shared         = false
}

resource "akamai_cloudlets_policy_activation" "policy_activation" {
  policy_id             = tonumber(akamai_cloudlets_policy.policy.id)
  network               = var.env
  version               = akamai_cloudlets_policy.policy.version
  associated_properties = var.associated_properties
}
