/*
* Here is an example of how to provision an Edgeworker, create the tarball,
* deploy the bundle to Akamai and activate. If the bundle changes, a new
* tarball will be created and a new version of the Edgeworker will activate
* 
* Cross-platform support for the tarball creation is included, using PowerShell on 
* Windows and sh on other platforms. The local-exec provisioner will run on the machine 
* where Terraform is being executed, so make sure you have the necessary permissions to 
* create files in the working directory.
*/

locals {
  ewpath     = "${path.cwd}/bundle"
  is_windows = substr(lower(replace(path.cwd, "\\", "/")), 1, 1) == ":"
}

data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "null_resource" "bundle" {
  provisioner "local-exec" {
    interpreter = local.is_windows ? ["PowerShell", "-NoProfile", "-NonInteractive", "-Command"] : ["/bin/sh", "-c"]
    working_dir = local.ewpath
    command     = local.is_windows ? "$ErrorActionPreference = 'Stop'; if (Test-Path '${path.cwd}/bundle.tar.gz') { Remove-Item -Force '${path.cwd}/bundle.tar.gz' }; Compress-Archive -Path * -DestinationPath '${path.cwd}/bundle.tar.gz' -Force" : "tar zcfv \"${path.cwd}/bundle.tar.gz\" *"
  }

  triggers = {
    bundle_sha1 = "${sha1(file("${local.ewpath}/bundle.json"))}"
  }
}

resource "akamai_edgeworker" "edgeworker" {
  group_id         = data.akamai_contract.contract.group_id
  name             = var.name
  resource_tier_id = 100
  local_bundle     = "${path.cwd}/bundle.tar.gz"
  depends_on       = [null_resource.bundle]
}

resource "akamai_edgeworkers_activation" "edgeworker" {
  edgeworker_id = akamai_edgeworker.edgeworker.edgeworker_id
  network       = "STAGING"
  version       = akamai_edgeworker.edgeworker.version
}
