/**
 * # API Definitions Example (OpenAPI)
 *
 * This example creates and activates an Akamai API definition by converting an
 * OpenAPI 3.0 specification into the Akamai API descriptor format automatically.
 * It covers the full lifecycle from definition creation through activation on
 * both the Staging and Production networks.
 *
 * ## Workflow
 *
 * 1. `akamai_group` data source resolves the contract and group IDs required by
 *    all subsequent resources.
 * 2. `akamai_apidefinitions_openapi` data source reads `petstore-3.0.yml` and
 *    converts it into the JSON payload expected by the Akamai API Definitions
 *    API. This conversion happens at plan time with no external API calls.
 * 3. `akamai_apidefinitions_api` creates the API definition using the converted
 *    payload from the data source. Any update to the OpenAPI spec file triggers
 *    a new API version.
 * 4. `akamai_apidefinitions_activation` activates the latest version on
 *    **STAGING** and **PRODUCTION** independently, so each network can be
 *    managed and rolled back separately.
 *
 * ## OpenAPI Specification File
 *
 * The API is described in `petstore-3.0.yml`. Any valid OpenAPI 3.0 document
 * can be used here. For an alternative that uploads a raw Akamai API JSON
 * descriptor directly, see the companion `api/` example which uses
 * `akamai_apidefinitions_api` with a hand-crafted `api.json` file.
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

data "akamai_apidefinitions_openapi" "petstore" {
  file_path = "${path.module}/petstore-3.0.yml"
}

resource "akamai_apidefinitions_api" "api" {
  api         = data.akamai_apidefinitions_openapi.petstore.api
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
