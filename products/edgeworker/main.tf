/*
* Here is an example of how to provision an Edgeworker, create the tarball,
* deploy the bundle to Akamai and activate. If the bundle changes, a new
* tarball will be created and a new version of the Edgeworker will activate
*/

locals {
  ewpath = "${path.cwd}/bundle"
}

resource "null_resource" "bundle" {
  provisioner "local-exec" {
    command = "cd ${local.ewpath};tar zcfv ${path.cwd}/bundle.tar.gz *"
  }

  triggers = {
    bundle_sha1 = "${sha1(file("${local.ewpath}/bundle.json"))}"
  }
}

resource "akamai_edgeworker" "edgeworker" {
  group_id         = var.group_id
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
