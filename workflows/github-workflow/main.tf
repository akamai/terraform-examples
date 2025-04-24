/**
* # Terraform Property Manager Multiple Environments Template
*
* The purpose of this template is to ease the process of managing multiple environment properties (e.g. dev, qa, stage, prod) in Terraform by leveraging the [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs) in a GitHub Workflow. 
*
* * GitHub Actions used to run the workflow that executes Terraform to update the Akamai Property.
* * A Python script gets a Cloud Access Manager Key ID. This step is **optional**.
* * Terraform's state file is stored remotely in Linode's Object Storage (S3 compatible).
* * Terraform updates and activates a property based on the changes performed to the rule tree. 
*
* ## Prerequisites
* - [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials). Also familiarize with concepts related to the `.edgerc` file.
* - [Make Your First API Call with Python](https://techdocs.akamai.com/developer/docs/python)
* - [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
* - Basic Understanding of [GitHub Actions](https://docs.github.com/en/actions) and setting up [secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).
* - [Linode Object Storage](https://www.linode.com/lp/object-storage/) bucket with Access Keys created for storing Terraform's state file.
*
* ### Additional Inputs for TF
* This step is optional, however it represents a common situation where information from other sources must be collected before it can be used in Terraform. The use case here is to query the Akamai Cloud Access Manager (CAM) for the Key ID via Akamai APIs in a Python script. 
* The Key ID then is used as input to the TF code to populate a field in the rule tree. This step is handy in case the feature is not yet supported in Terraform. CAM functionality was added to the Akamai provider on version 6.3.0 (July 16, 2024) though.
*
* ## Linode Object Storage for TF Remote Backend
* This template uses an S3 compatible [Linode Object Storage](https://www.linode.com/lp/object-storage/) bucket to store Terraform's state file. However any other supported remote backend can be configured.
*
* This step is essential to the template as the environment parameterization within the code will result in different TF state files based on the environment. This is good because it also provides state file isolation per environment.
* 
* ## GitHub Workflow Setup
* For this demo, temporary Akamai API Credentials credentials are stored as Secret Repository variables. The naming convention for the variables used is:
*
* - AKAMAI_CREDENTIAL_CLIENT_SECRET = Akamai `client_secret` credential
* - AKAMAI_CREDENTIAL_HOST = Akamai `host` credential
* - AKAMAI_CREDENTIAL_ACCESS_TOKEN = Akamai `access_token` credential
* - AKAMAI_CREDENTIAL_CLIENT_TOKEN = Akamai `client_token` credential
*
* As an option you can specify the Account Switch Key if needed:
*
* - AKAMAI_ACCOUNT_KEY = Akamai account key for the account
* 
* Additionally for the S3 compatible Linode Object Storage the following Secret Repository variables are required:
* 
* - LINODE_OBJECT_STORAGE_BUCKET = the name of the bucket
* - LINODE_OBJECT_STORAGE_ACCESS_KEY = access key for the Object Storage
* - LINODE_OBJECT_STORAGE_SECRET_KEY = secret key for the Object Storage
* 
* * In the `.github/workflows/akamai_pm.yaml` these variables are referenced to build the Terraform configurations.
* * The Akamai variables are used to perform operations on the property such as create, update and destroy during the `terraform apply` step. Observe that these are passed as `TF_VAR_*` TF environment variables that TF can recognize.
* * The Linode variables are used to build the Terraform's backend configuration which then is passed to TF during the `terraform init` command.
*
* ### GitHub Actions
* The following GitHub actions play a role in this workflow:
* - actions/checkout@v4: setup for git operations
* - py-actions/py-dependency-install@v4: setup Python script dependencies
* - hashicorp/setup-terraform@v3: setup for Terraform
* - actions/upload-artifact@v4: upload artifacts
*
* ## Import Existing Property
* Often times you want to manage an existing resource on Akamai via Terraform. For this to be successful the initial Terraform state must be created. This can be done by executing the `import.sh` script which runs the necessary `terraform import` commands for all the resources exported by the Akamai Terraform CLI.
*
* In the `.github/workflows/akamai_pm.yaml` you will find this step, however it is commented out, and the reason is because it was executed on the very first run just to get the Terraform state generated. After that initial run you can comment it out or just remove it from the GitHub workflow code.
*
* ## Examples
* An example is shown below. Please refer to the example directory in this git repo for further details
* ```hcl
* property_name   = "github-workflow.dev.tf-demo.download-delivery"
* hostname        = "github-workflow.dev.tf-demo.com"
* origin_hostname = "dev-origin.github-workflow.tf-demo.com"
* edge_hostname   = "jaescalo.test.edgekey.net"
* cp_code_name    = "Download Delivery Demo CP Code"
* cam_key_id      = "11727"
* emails          = ["dev-team@noreply.com"]
* ```
*/

data "akamai_group" "group" {
  group_name  = var.group_name
  contract_id = var.contract_id
}

data "akamai_contract" "contract" {
  group_name = data.akamai_group.group.group_name
}

resource "akamai_cp_code" "cp-code" {
  product_id  = var.product_id
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_contract.contract.group_id
  name        = var.cp_code_name
}

resource "akamai_edge_hostname" "edge-hostname-edgekey-net" {
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_group.group.id
  ip_behavior   = "IPV6_COMPLIANCE"
  edge_hostname = var.edge_hostname
}

resource "akamai_property" "github-workflow-tf-demo" {
  name        = var.property_name
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_group.group.id
  product_id  = var.product_id
  hostnames {
    cname_from             = var.hostname
    cname_to               = akamai_edge_hostname.edge-hostname-edgekey-net.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  rule_format   = data.akamai_property_rules_builder.github-workflow-tf-demo_rule_default.rule_format
  rules         = data.akamai_property_rules_builder.github-workflow-tf-demo_rule_default.json
  version_notes = var.version_notes
  # Version notes depend on values that change on every commit. Ignoring notes as a valid change
  lifecycle {
    ignore_changes = [
      version_notes,
    ]
  }
}

resource "akamai_property_activation" "github-workflow-tf-demo-staging" {
  property_id                    = akamai_property.github-workflow-tf-demo.id
  contact                        = var.emails
  version                        = var.activate_latest_on_staging ? akamai_property.github-workflow-tf-demo.latest_version : akamai_property.github-workflow-tf-demo.staging_version
  network                        = "STAGING"
  note                           = var.version_notes
  auto_acknowledge_rule_warnings = true

  # Activation notes depend on values that change on every commit. Ignoring notes as a valid change
  lifecycle {
    ignore_changes = [
      note,
    ]
  }
}

resource "akamai_property_activation" "github-workflow-tf-demo-production" {
  property_id                    = akamai_property.github-workflow-tf-demo.id
  contact                        = var.emails
  version                        = var.activate_latest_on_production ? akamai_property.github-workflow-tf-demo.latest_version : akamai_property.github-workflow-tf-demo.production_version
  network                        = "PRODUCTION"
  note                           = var.version_notes
  auto_acknowledge_rule_warnings = true

  # Activation notes depend on values that change on every commit. Ignoring notes as valid change
  lifecycle {
    ignore_changes = [
      note,
    ]
  }
  compliance_record {
    noncompliance_reason_no_production_traffic {
      ticket_id = "123"
    }
  }
}
