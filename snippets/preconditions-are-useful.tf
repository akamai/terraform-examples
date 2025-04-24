/* 
* Terraform has a facility for checking that a precondition exists before
* allowing a resource to be modified. The example below prevents DNS from 
* being updated until the SBD certs are deployed to the platform. For more
* information, see 
* https://developer.hashicorp.com/terraform/language/expressions/custom-conditions
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
