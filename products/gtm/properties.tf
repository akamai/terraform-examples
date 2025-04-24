# The load balancer
resource "akamai_gtm_property" "lb" {
  domain                      = akamai_gtm_domain.example_co_uk.name
  name                        = "lb"
  type                        = "weighted-round-robin"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 30
  handout_limit               = 0
  handout_mode                = "normal"
  failover_delay              = 0
  failback_delay              = 0
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.uk.datacenter_id
    enabled       = true
    weight        = 50
    servers       = []
    handout_cname = "lb-2.example.co.uk.akadns.net"
  }
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.Dublin.datacenter_id
    enabled       = true
    weight        = 50
    servers       = []
    handout_cname = "lb-1.example.co.uk.akadns.net"
  }
}

# The primary/failover for Frankfurt
resource "akamai_gtm_property" "lb-1" {
  domain                      = akamai_gtm_domain.example_co_uk.name
  name                        = "lb-1"
  type                        = "failover"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 30
  handout_limit               = 0
  handout_mode                = "normal"
  failover_delay              = 0
  failback_delay              = 0
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.Frankfurt.datacenter_id
    enabled       = true
    weight        = 1
    servers       = ["188.74.74.21"]
  }
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.Dublin.datacenter_id
    enabled       = true
    weight        = 0
    servers       = ["188.74.74.20"]
  }
  liveness_test {
    name                             = "Liveness"
    peer_certificate_verification    = false
    test_interval                    = 60
    test_object                      = "/"
    http_error3xx                    = true
    http_error4xx                    = true
    http_error5xx                    = true
    http_method                      = "GET"
    pre_2023_security_posture        = false
    disabled                         = false
    test_object_protocol             = "HTTP"
    test_object_port                 = 80
    disable_nonstandard_port_warning = false
    test_timeout                     = 10
    answers_required                 = false
    recursion_requested              = false
  }
}

# The primary/failover for Dublin
resource "akamai_gtm_property" "lb-2" {
  domain                      = akamai_gtm_domain.example_co_uk.name
  name                        = "lb-2"
  type                        = "failover"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 30
  handout_limit               = 0
  handout_mode                = "normal"
  failover_delay              = 0
  failback_delay              = 0
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.Frankfurt.datacenter_id
    enabled       = true
    weight        = 0
    servers       = ["188.74.74.21"]
  }
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.Dublin.datacenter_id
    enabled       = true
    weight        = 1
    servers       = ["188.74.74.20"]
  }
  liveness_test {
    name                             = "Liveness"
    peer_certificate_verification    = false
    test_interval                    = 60
    test_object                      = "/"
    http_error3xx                    = true
    http_error4xx                    = true
    http_error5xx                    = true
    http_method                      = "GET"
    pre_2023_security_posture        = false
    disabled                         = false
    test_object_protocol             = "HTTP"
    test_object_port                 = 80
    disable_nonstandard_port_warning = false
    test_timeout                     = 10
    answers_required                 = false
    recursion_requested              = false
  }
}
