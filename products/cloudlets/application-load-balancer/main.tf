/*
* # Application Load Balancer Cloudlet Module
*
* This is a simple example of an Application Load Balancer policy
*/
resource "akamai_cloudlets_policy" "policy" {
  name              = var.policy_name
  cloudlet_code     = "ALB"
  description       = var.description
  group_id          = var.group_id
  match_rule_format = "1.0"
  match_rules       = data.akamai_cloudlets_application_load_balancer_match_rule.match_rules_alb.json
  is_shared         = false
}

resource "akamai_cloudlets_policy_activation" "policy_activation" {
  policy_id             = tonumber(akamai_cloudlets_policy.policy.id)
  network               = var.env
  version               = akamai_cloudlets_policy.policy.version
  associated_properties = var.associated_properties
}
