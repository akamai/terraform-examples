/*
* # Image Manager Video Policy Module
*
* An example of how to manage Image Manager video policy with Terraform
*/

resource "akamai_imaging_policy_set" "videos" {
  contract_id = var.contract_id
  name        = "${var.policy_set_name}-Videos"
  region      = var.region
  type        = "VIDEO"
}

resource "akamai_imaging_policy_video" "policy" {
  activate_on_production = var.activate_on_production
  contract_id            = var.contract_id
  policy_id              = ".auto"
  policyset_id           = akamai_imaging_policy_set.videos.id
  json                   = file("${path.module}/policies/videos.json")
}
