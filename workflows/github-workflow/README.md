<!-- BEGIN_TF_DOCS -->

# Terraform Property Manager Multiple Environments Template

The purpose of this template is to ease the process of managing multiple environment properties (e.g. dev, qa, stage, prod) in Terraform by leveraging the [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs) in a GitHub Workflow.

* GitHub Actions used to run the workflow that executes Terraform to update the Akamai Property.
* A Python script gets a Cloud Access Manager Key ID. This step is **optional**.
* Terraform's state file is stored remotely in Linode's Object Storage (S3 compatible).
* Terraform updates and activates a property based on the changes performed to the rule tree.

## Prerequisites
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials). Also familiarize with concepts related to the `.edgerc` file.
- [Make Your First API Call with Python](https://techdocs.akamai.com/developer/docs/python)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- Basic Understanding of [GitHub Actions](https://docs.github.com/en/actions) and setting up [secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).
- [Linode Object Storage](https://www.linode.com/lp/object-storage/) bucket with Access Keys created for storing Terraform's state file.

### Additional Inputs for TF
This step is optional, however it represents a common situation where information from other sources must be collected before it can be used in Terraform. The use case here is to query the Akamai Cloud Access Manager (CAM) for the Key ID via Akamai APIs in a Python script.
The Key ID then is used as input to the TF code to populate a field in the rule tree. This step is handy in case the feature is not yet supported in Terraform. CAM functionality was added to the Akamai provider on version 6.3.0 (July 16, 2024) though.

## Linode Object Storage for TF Remote Backend
This template uses an S3 compatible [Linode Object Storage](https://www.linode.com/lp/object-storage/) bucket to store Terraform's state file. However any other supported remote backend can be configured.

This step is essential to the template as the environment parameterization within the code will result in different TF state files based on the environment. This is good because it also provides state file isolation per environment.

## GitHub Workflow Setup
For this demo, temporary Akamai API Credentials credentials are stored as Secret Repository variables. The naming convention for the variables used is:

- AKAMAI\_CREDENTIAL\_CLIENT\_SECRET = Akamai `client_secret` credential
- AKAMAI\_CREDENTIAL\_HOST = Akamai `host` credential
- AKAMAI\_CREDENTIAL\_ACCESS\_TOKEN = Akamai `access_token` credential
- AKAMAI\_CREDENTIAL\_CLIENT\_TOKEN = Akamai `client_token` credential

As an option you can specify the Account Switch Key if needed:

- AKAMAI\_ACCOUNT\_KEY = Akamai account key for the account

Additionally for the S3 compatible Linode Object Storage the following Secret Repository variables are required:

- LINODE\_OBJECT\_STORAGE\_BUCKET = the name of the bucket
- LINODE\_OBJECT\_STORAGE\_ACCESS\_KEY = access key for the Object Storage
- LINODE\_OBJECT\_STORAGE\_SECRET\_KEY = secret key for the Object Storage

* In the `.github/workflows/akamai_pm.yaml` these variables are referenced to build the Terraform configurations.
* The Akamai variables are used to perform operations on the property such as create, update and destroy during the `terraform apply` step. Observe that these are passed as `TF_VAR_*` TF environment variables that TF can recognize.
* The Linode variables are used to build the Terraform's backend configuration which then is passed to TF during the `terraform init` command.

### GitHub Actions
The following GitHub actions play a role in this workflow:
- actions/checkout@v4: setup for git operations
- py-actions/py-dependency-install@v4: setup Python script dependencies
- hashicorp/setup-terraform@v3: setup for Terraform
- actions/upload-artifact@v4: upload artifacts

## Import Existing Property
Often times you want to manage an existing resource on Akamai via Terraform. For this to be successful the initial Terraform state must be created. This can be done by executing the `import.sh` script which runs the necessary `terraform import` commands for all the resources exported by the Akamai Terraform CLI.

In the `.github/workflows/akamai_pm.yaml` you will find this step, however it is commented out, and the reason is because it was executed on the very first run just to get the Terraform state generated. After that initial run you can comment it out or just remove it from the GitHub workflow code.

## Examples
An example is shown below. Please refer to the example directory in this git repo for further details
```hcl
property_name   = "github-workflow.dev.tf-demo.download-delivery"
hostname        = "github-workflow.dev.tf-demo.com"
origin_hostname = "dev-origin.github-workflow.tf-demo.com"
edge_hostname   = "jaescalo.test.edgekey.net"
cp_code_name    = "Download Delivery Demo CP Code"
cam_key_id      = "11727"
emails          = ["dev-team@noreply.com"]
```

# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Optional variables
  	 activate_latest_on_production  = <bool> | default: true
  	 activate_latest_on_staging  = <bool> | default: true
  	 akamai_access_token  = <string> | default: ""
  	 akamai_account_key  = <string> | default: ""
  	 akamai_client_secret  = <string> | default: ""
  	 akamai_client_token  = <string> | default: ""
  	 akamai_host  = <string> | default: ""
  	 cam_key_guid  = <string> | default: ""
  	 cam_key_id  = <string> | default: ""
  	 config_section  = <string> | default: "default"
  	 contract_id  = <string> | default: "ctr_1-1NC95D"
  	 cp_code_name  = <string> | default: "CP Code"
  	 edge_hostname  = <string> | default: ""
  	 emails  = <list(string)> | default: [
  "noreply@akamai.com"
]
  	 group_name  = <string> | default: "Demos - Templates"
  	 hostname  = <string> | default: ""
  	 origin_hostname  = <string> | default: ""
  	 product_id  = <string> | default: "prd_Download_Delivery"
  	 property_name  = <string> | default: ""
  	 version_notes  = <string> | default: "Tests Performed Locally"
}
 ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | = 6.2.0 |
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | = 2.23.0 |

## Resources

| Name | Type |
|------|------|
| [akamai_cp_code.cp-code](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/resources/cp_code) | resource |
| [akamai_edge_hostname.edge-hostname-edgekey-net](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/resources/edge_hostname) | resource |
| [akamai_property.github-workflow-tf-demo](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/resources/property) | resource |
| [akamai_property_activation.github-workflow-tf-demo-production](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/resources/property_activation) | resource |
| [akamai_property_activation.github-workflow-tf-demo-staging](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/resources/property_activation) | resource |
| [akamai_contract.contract](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/contract) | data source |
| [akamai_group.group](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/group) | data source |
| [akamai_property_rules_builder.github-workflow-tf-demo_rule_completely_static_content](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.github-workflow-tf-demo_rule_default](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/property_rules_builder) | data source |
| [akamai_property_rules_builder.github-workflow-tf-demo_rule_redirect_to_https](https://registry.terraform.io/providers/akamai/akamai/6.2.0/docs/data-sources/property_rules_builder) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_latest_on_production"></a> [activate\_latest\_on\_production](#input\_activate\_latest\_on\_production) | Activate the Property to Production | `bool` | `true` | no |
| <a name="input_activate_latest_on_staging"></a> [activate\_latest\_on\_staging](#input\_activate\_latest\_on\_staging) | Activate the Property to Staging | `bool` | `true` | no |
| <a name="input_akamai_access_token"></a> [akamai\_access\_token](#input\_akamai\_access\_token) | Akamai access\_token API credential | `string` | `""` | no |
| <a name="input_akamai_account_key"></a> [akamai\_account\_key](#input\_akamai\_account\_key) | Akamai Account Key | `string` | `""` | no |
| <a name="input_akamai_client_secret"></a> [akamai\_client\_secret](#input\_akamai\_client\_secret) | Akamai client\_secret API credential | `string` | `""` | no |
| <a name="input_akamai_client_token"></a> [akamai\_client\_token](#input\_akamai\_client\_token) | Akamai client\_token API credential | `string` | `""` | no |
| <a name="input_akamai_host"></a> [akamai\_host](#input\_akamai\_host) | Akamai host API credential | `string` | `""` | no |
| <a name="input_cam_key_guid"></a> [cam\_key\_guid](#input\_cam\_key\_guid) | Cloud Access Manager Key GUID | `string` | `""` | no |
| <a name="input_cam_key_id"></a> [cam\_key\_id](#input\_cam\_key\_id) | Cloud Access Manager Key ID | `string` | `""` | no |
| <a name="input_config_section"></a> [config\_section](#input\_config\_section) | Section for the credentials in the .edgerc | `string` | `"default"` | no |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Akamai Contract ID | `string` | `"ctr_1-1NC95D"` | no |
| <a name="input_cp_code_name"></a> [cp\_code\_name](#input\_cp\_code\_name) | Name for the CP Code to Create | `string` | `"CP Code"` | no |
| <a name="input_edge_hostname"></a> [edge\_hostname](#input\_edge\_hostname) | Akamai Edge Hostname | `string` | `""` | no |
| <a name="input_emails"></a> [emails](#input\_emails) | List of Emails for Notifications | `list(string)` | <pre>[<br/>  "noreply@akamai.com"<br/>]</pre> | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Akamai Access Group Name | `string` | `"Demos - Templates"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Property Hostname | `string` | `""` | no |
| <a name="input_origin_hostname"></a> [origin\_hostname](#input\_origin\_hostname) | Origin Server Hostname | `string` | `""` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | Property Product ID | `string` | `"prd_Download_Delivery"` | no |
| <a name="input_property_name"></a> [property\_name](#input\_property\_name) | Property Name | `string` | `""` | no |
| <a name="input_version_notes"></a> [version\_notes](#input\_version\_notes) | Notes for the property version and activations | `string` | `"Tests Performed Locally"` | no |

## Outputs

No outputs.

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->