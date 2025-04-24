/*
* The DNS challenges for SBD certificates are provided in the "hostnames" 
* computed attribute on the akamai_property resource.You can export them 
* as a map (key = value) with the following code
*/

locals {
  challenges = {
    for entry in akamai_property.saas_config.hostnames :
    entry.cert_status[0].hostname => entry.cert_status[0].target
  }
}

/*
* You can use these challenges to update DNS with the challenge CNAME
* Note, we need to iterate over var.hostnames rather than local.challenges
* because challenges is a computed field which isn't known until after
* apply. Terraform doesn't like this. However, there'll be an entry for
* each hostname and we know the hostnames in advance, so it's ok to use
* this for iteration instead.
*/
resource "akamai_dns_record" "validations" {
  for_each = toset(var.hostnames)

  zone       = var.zone
  name       = "_acme-challenge.${each.key}"
  recordtype = "CNAME"
  target     = [local.challenges["_acme-challenge.${each.key}"]]
  ttl        = 1800
}

/* 
* Later, when the cert has validated and deployed to the Akamai platform,
* you can go live by updating DNS to CNAME your site to the akamai Edge Hostname
* You can add a final check for the cert status using a precondition based on
* the "hostnames" attribute on the akamai_property_hostnames datasource to
* block go-live until the cert is deployed.
*/
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
        for hostname in data.akamai_property_hostnames.hostnames.hostnames :
        alltrue([
          for cert in hostname.cert_status : cert.production_status == "DEPLOYED"
        ])
        if hostname.cname_from == each.value
      ])
      error_message = "Certificate for ${each.value} is not yet deployed to production"
    }
  }
}
