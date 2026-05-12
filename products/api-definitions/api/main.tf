/**
 * # API Definitions Example (JSON)
 *
 * This example creates and activates an Akamai API definition using a raw JSON
 * file as the API descriptor. It covers the full lifecycle from definition
 * creation through activation on both the Staging and Production networks.
 *
 * ## Workflow
 *
 * 1. `akamai_group` data source resolves the contract and group IDs required by
 *    all subsequent resources.
 * 2. `akamai_apidefinitions_api` creates the API definition by uploading the
 *    contents of `api.json`. Any update to that file triggers a new API version.
 * 3. `akamai_apidefinitions_activation` activates the latest version on
 *    **STAGING** and **PRODUCTION** independently, so each network can be
 *    managed and rolled back separately.
 *
 * ## API Definition File
 *
 * The API is described in `api.json`. This file must conform to the schema
 * expected by the Akamai API Definitions API. For an alternative that derives
 * the JSON payload automatically from an OpenAPI specification, see the
 * companion `openapi/` example which uses the
 * `akamai_apidefinitions_openapi` data source.
 *
 * ## ⚠️ ID Prefix Stripping
 *
 * The Akamai provider returns `contract_id` and `group_id` values prefixed with
 * `ctr_` and `grp_` respectively. The `trimprefix()` calls remove these prefixes
 * before passing the values to `akamai_apidefinitions_api`, which expects bare
 * numeric IDs.
*/


data "akamai_group" "group" {
  group_name  = "Group-1"
  contract_id = "Contract-1"
}

resource "akamai_apidefinitions_api" "api" {
  api         = file("${path.module}/api.json")
  contract_id = trimprefix(data.akamai_group.group.contract_id, "ctr_")
  group_id    = trimprefix(data.akamai_group.group.id, "grp_")
}

resource "akamai_apidefinitions_activation" "api_activation_staging" {
  api_id                    = akamai_apidefinitions_api.api.id
  version                   = akamai_apidefinitions_api.api.latest_version
  network                   = "STAGING"
  notification_recipients   = ["user@example.com"]
  notes                     = "Notes"
  auto_acknowledge_warnings = true
}

resource "akamai_apidefinitions_activation" "api_activation_production" {
  api_id                    = akamai_apidefinitions_api.api.id
  version                   = akamai_apidefinitions_api.api.latest_version
  network                   = "PRODUCTION"
  notification_recipients   = ["user@example.com"]
  notes                     = "Notes"
  auto_acknowledge_warnings = true
}
