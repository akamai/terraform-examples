/*
* This module will update DNS to CNAME the site to the edge hostname. It has a
* precondition in place to check that the SBD certs are deployed before it will
* allow this to happen. You should therefore wait ~8mins between updating the 
* properties with the new hostnames and  running this script. If the precondition
* fails, you should wait a short while and try again
*/
data "akamai_property" "property" {
  name = var.property_name
}

data "akamai_property_hostnames" "hostnames" {
  group_id    = data.akamai_property.property.group_id
  contract_id = data.akamai_property.property.contract_id
  property_id = data.akamai_property.property.id
}

locals {
  hostname_cert_status = data.akamai_property_hostnames.hostnames.hostname_bucket
}

output "status" {
  value = local.hostname_cert_status
}

resource "akamai_dns_record" "golive" {
  for_each = toset(var.hostnames)

  zone       = var.zone
  name       = each.value
  recordtype = "CNAME"
  target     = [var.edge_hostname]
  ttl        = 1800

  lifecycle {
    precondition {
      condition = anytrue([
        for hostname in local.hostname_cert_status :
        alltrue([
          for cert in hostname.cert_status : cert.production_status == "DEPLOYED"
        ])
        if hostname.cname_from == each.value
      ])
      error_message = "Certificate for ${each.value} is not yet deployed to production"
    }
  }
}
