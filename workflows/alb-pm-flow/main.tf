/*
 * # ALB + Property Manager Workflow — Property Stage
 *
 * This directory is used in STAGE 1 and STAGE 3 of the full onboarding workflow.
 * Stage 2 (ALB setup) lives in the sibling ../alb/ directory.
 *
 * ─────────────────────────────────────────────────────────────────────────────
 * STAGE 1 — Initial Property and ALB Setup
 * ─────────────────────────────────────────────────────────────────────────────
 *   terraform apply
 *
 *   1. Creates the property via the rules-as-hcl module.
 *   2. Adds conditional origins to the property rules. Conditional origins are
 *      origin behaviors with a unique origin_id (e.g. "origin-a", "origin-b")
 *      that the ALB cloudlet policy will reference in Stage 2. Add them to the
 *      rules-as-hcl/rules sub-module before applying.
 *   3. Activates the property to Akamai Staging/Production.
 *
 * ─────────────────────────────────────────────────────────────────────────────
 * STAGE 1 Continued — ALB Setup
 * ─────────────────────────────────────────────────────────────────────────────
 *
 *   4. Creates the ALB cloudlet policy with match rules.
 *   5. Creates load balancers using the conditional origin IDs defined in the
 *      Stage 1 property rules (origin_id_1 and origin_id_2 must match exactly).
 *   6. Activates the ALB policy and load balancers to staging/production.
 *
 *   After Stage 1 completes, note the alb_cloudlet_policy_id from the output.
* This will be used in Stage 2 to add the ALB behavior to the property rules.
 *
 * ─────────────────────────────────────────────────────────────────────────────
 * STAGE 2 — Add ALB Behavior (new property onboarding only)
 * ─────────────────────────────────────────────────────────────────────────────
 *   Uncomment the alb_cloudlet_policy_id and set the value from the previous output
 *   (policy ID) in your tfvars file, then run:
 *
 *   terraform apply 
 *
 *   1. Updates the property rules to include the ALB cloudlet behavior pointing
 *      to the policy created in Stage 2.
 *   2. Activates the updated property to Staging (and Production if configured).
 *
 *   NOTE: Run this AFTER Stage 2 has completed successfully.
 *
 */

locals {
  alb_ruleset = compact([
    var.alb_cloudlet_policy_id != 0 ? data.akamai_property_rules_builder.rule_alb_behavior.json : null,
    data.akamai_property_rules_builder.rule_conditional_origin_group.json,
  ])
}

module "property" {
  source = "../../products/property/rules-as-hcl"

  group_name                    = var.group_name
  property_name                 = var.property_name
  hostname                      = var.hostname
  product_id                    = var.product_id
  rule_format                   = var.rule_format
  default_origin                = var.default_origin
  sure_route_test_object        = var.sure_route_test_object
  td_region                     = var.td_region
  contacts                      = var.contacts
  include_external_rules        = local.alb_ruleset
  notes                         = var.notes
  activate_latest_on_staging    = var.activate_latest_on_staging
  activate_latest_on_production = var.activate_latest_on_production
}


data "akamai_contract" "contract" {
  group_name = var.group_name
}

module "alb" {
  source = "../../products/cloudlets/application-load-balancer"

  group_id              = data.akamai_contract.contract.group_id
  policy_name           = var.alb_cloudlet_policy_name
  description           = var.description
  env                   = var.activation_network
  associated_properties = [var.property_name]
  alb_load_balancers    = var.alb_load_balancers
  alb_lb_data_centers   = var.alb_lb_data_centers

  depends_on = [module.property]
}