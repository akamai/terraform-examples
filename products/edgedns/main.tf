/*
* # EdgeDNS Module
*
* Demonstrate how to use EdgeDNS provider
*/

resource "akamai_dns_zone" "tld" {
  contract                 = var.contract_id
  group                    = var.group_id
  zone                     = var.zone
  type                     = "PRIMARY"
  masters                  = []
  comment                  = ""
  sign_and_serve           = false
  sign_and_serve_algorithm = ""
  target                   = ""
  end_customer_id          = ""
}


resource "akamai_dns_record" "tld_AKAMAITLC" {
  zone       = var.zone
  name       = var.zone
  recordtype = "AKAMAITLC"
  target     = []
  ttl        = 1800
}

resource "akamai_dns_record" "tld_CAA" {
  zone       = var.zone
  name       = var.zone
  recordtype = "CAA"
  target     = ["0 issue \"letsencrypt.org\"", "0 issue \"digicert.com\""]
  ttl        = 1800
}

resource "akamai_dns_record" "tld_NS" {
  zone       = var.zone
  name       = var.zone
  recordtype = "NS"
  target     = ["a1-91.akam.net.", "a13-64.akam.net.", "a20-65.akam.net.", "a22-66.akam.net.", "a24-67.akam.net.", "a9-64.akam.net."]
  ttl        = 86400
}

resource "akamai_dns_record" "tld_SOA" {
  zone          = var.zone
  email_address = "hostmaster.example.com."
  expiry        = 604800
  name          = var.zone
  name_server   = "a1-91.akam.net."
  nxdomain_ttl  = 300
  recordtype    = "SOA"
  refresh       = 3600
  retry         = 600
  target        = []
  ttl           = 86400
}

resource "akamai_dns_record" "tld_TXT" {
  zone       = var.zone
  name       = var.zone
  recordtype = "TXT"
  target     = ["\"v=spf1 include:hotmail.com ~all\"", "\"MS=ms44571570\""]
  ttl        = 3600
}

resource "akamai_dns_record" "_dnsauth_TXT" {
  zone       = var.zone
  name       = "_dnsauth.${var.zone}"
  recordtype = "TXT"
  target     = ["\"r3y6hyhg566y1zyzm8c9bjc33s2t5yth\""]
  ttl        = 1800
}

resource "akamai_dns_record" "autodiscover_CNAME" {
  zone       = var.zone
  name       = "autodiscover.${var.zone}"
  recordtype = "CNAME"
  target     = ["autodiscover.outlook.com."]
  ttl        = 1800
}

resource "akamai_dns_record" "kibana_A" {
  zone       = var.zone
  name       = "kibana.${var.zone}"
  recordtype = "A"
  target     = ["18.133.176.108"]
  ttl        = 600
}

resource "akamai_dns_record" "origin-blue_CNAME" {
  zone       = var.zone
  name       = "origin-blue.${var.zone}"
  recordtype = "CNAME"
  target     = ["origin.example.com."]
  ttl        = 1800
}

resource "akamai_dns_record" "origin-demo_CNAME" {
  zone       = var.zone
  name       = "origin-demo.${var.zone}"
  recordtype = "CNAME"
  target     = ["origin.example.com."]
  ttl        = 3600
}

resource "akamai_dns_record" "origin_CNAME" {
  zone       = var.zone
  name       = "origin.${var.zone}"
  recordtype = "CNAME"
  target     = ["linode.example.com."]
  ttl        = 300
}

resource "akamai_dns_record" "origin1_A" {
  zone       = var.zone
  name       = "origin1.${var.zone}"
  recordtype = "A"
  target     = ["23.92.24.17"]
  ttl        = 1800
}

resource "akamai_dns_record" "secure_CNAME" {
  zone       = var.zone
  name       = "secure.${var.zone}"
  recordtype = "CNAME"
  target     = ["secure.example.com.edgekey-staging.net."]
  ttl        = 1800
}

resource "akamai_dns_record" "shop_CNAME" {
  zone       = var.zone
  name       = "shop.${var.zone}"
  recordtype = "CNAME"
  target     = ["ion.example.com.edgesuite-staging.net."]
  ttl        = 1800
}

resource "akamai_dns_record" "vpn_A" {
  zone       = var.zone
  name       = "vpn.${var.zone}"
  recordtype = "A"
  target     = ["139.162.242.97"]
  ttl        = 1800
}

resource "akamai_dns_record" "www_CNAME" {
  zone       = var.zone
  name       = "www.${var.zone}"
  recordtype = "CNAME"
  target     = ["www.example.com.edgesuite.net."]
  ttl        = 300
}

resource "akamai_dns_record" "_sipfederationtls__tcp__tcp_SRV" {
  zone       = var.zone
  name       = "_sipfederationtls._tcp.example.com._tcp.${var.zone}"
  port       = 5061
  priority   = 10
  recordtype = "SRV"
  target     = ["federation.messenger.msn.com."]
  ttl        = 1800
  weight     = 2
}
