#config_section = "default"
group_id              = "12345"
policy_name           = "example_alb"
description           = "Change Notes"
env                   = "staging"
associated_properties = ["example_property"]

alb_load_balancers = {
  "load_balancer-a" = {
    id                  = "example_LB_ID"
    description         = "New LB 100/0"
    version_description = "New version"
    balancing_type      = "WEIGHTED"
  }
  "load_balancer-b" = {
    id                  = "example_LB_ID_2"
    description         = "New LB 75/25"
    version_description = "New version"
    balancing_type      = "WEIGHTED"
  }
}

alb_config_parameters = {
  "origin-a" = {
    origin_id                    = "example-origin-A"
    load_balancer_hostname       = "origin-a.example.com"
    load_balancer_liveness_hosts = ["origin-a.example.com"]
  }
  "origin-b" = {
    origin_id                    = "example-origin-B"
    load_balancer_hostname       = "origin-b.example.com"
    load_balancer_liveness_hosts = ["origin-b.example.com"]
  }
}