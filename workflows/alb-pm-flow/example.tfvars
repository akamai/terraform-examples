group_name                    = "My Group"
property_name                 = "example-alb-property"
hostname                      = "www.example.com"
default_origin                = "origin.example.com"
contacts                      = ["devteam@example.com"]
activate_latest_on_staging    = true
activate_latest_on_production = false

# Conditional Origins for ALB
alb_cloudlet_policy_name = "example_alb_policy"
activation_network       = "staging" # Options: staging, production

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

alb_lb_data_centers = {
  "origin-a" = {
    origin_id                    = "example-origin-a"
    load_balancer_hostname       = "origin-a.example.com"
    load_balancer_liveness_hosts = ["origin-a.example.com"]
  }
  "origin-b" = {
    origin_id                    = "example-origin-b"
    load_balancer_hostname       = "origin-b.example.com"
    load_balancer_liveness_hosts = ["origin-b.example.com"]
  }
}

# Stage 3: Set to the ALB policy name created in Stage 2 (../alb/), then re-apply.
# alb_cloudlet_policy_id = 123456
