/*
* # GTM Module
*
* This is an example of a GTM domain where we have two datacenters and three endpoints.
* This is intended for use by delivery Properties to choose their origin. It's an example
* of a load balanced failover pair of origin endpoints in a fully meshed configuration.
* 
* The first endpoint is a load balance configuration which will maintain 50/50 load balancer
* across two datacenter endpoints. This load balance will not use liveness test objects and
* will return a CNAME. The intended use for this endpoint is for users who visit your site that
* do not present a datacenter sticky cookie. You should use the hostname of this endpoint in
* your Origin Behaviour. Once the origin is visited, the origin should set a sticky cookie
* e.g. "origin=site1". When the next request comes from the browser, logic in the Property
* should choose an Origin Behaviour for either lb-1 or lb-2 in order to keep the session
* persistent for that user. Each of lb-1 and lb-2 are defined as primary/failover GTM 
* configurations. The intent of this is that if primary should fail, then the secondary IP
* address will be served instead. The "origin" sticky cookie will persist the end users
* session to this origin (the failover) for the duration of their session even if the primary
* comes back up.
* 
*/
resource "akamai_gtm_domain" "example_co_uk" {
  contract                  = var.contractid
  group                     = var.groupid
  name                      = "example.co.uk.akadns.net"
  type                      = "basic"
  comment                   = "change"
  email_notification_list   = ["example@example.org"]
  default_timeout_penalty   = 25
  load_imbalance_percentage = 10
  default_error_penalty     = 75
  cname_coalescing_enabled  = false
  load_feedback             = false
  end_user_mapping_enabled  = false
  sign_and_serve            = false
}
