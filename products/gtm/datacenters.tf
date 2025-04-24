resource "akamai_gtm_datacenter" "Dublin" {
  domain                            = akamai_gtm_domain.example_co_uk.name
  nickname                          = "Dublin"
  city                              = "Dublin"
  state_or_province                 = "County Dublin"
  country                           = "IE"
  latitude                          = 53.3441
  longitude                         = -6.26749
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
}

resource "akamai_gtm_datacenter" "Frankfurt" {
  domain                            = akamai_gtm_domain.example_co_uk.name
  nickname                          = "Frankfurt"
  city                              = "Frankfurt am Main"
  state_or_province                 = "Hessen"
  country                           = "DE"
  latitude                          = 50.11088
  longitude                         = 8.67949
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
}
