resource "akamai_cloudlets_application_load_balancer" "load_balancer_demo_LB_ID" {
  origin_id          = var.alb_load_balancers["load_balancer-a"].id
  origin_description = var.alb_load_balancers["load_balancer-a"].description
  description        = var.alb_load_balancers["load_balancer-a"].version_description
  balancing_type     = var.alb_load_balancers["load_balancer-a"].balancing_type

  data_centers {
    latitude                          = 33.74855
    longitude                         = -84.3915
    continent                         = "NA"
    country                           = "US"
    origin_id                         = var.alb_lb_data_centers["origin-a"].origin_id
    percent                           = 100
    cloud_service                     = false
    liveness_hosts                    = var.alb_lb_data_centers["origin-a"].load_balancer_liveness_hosts
    hostname                          = var.alb_lb_data_centers["origin-a"].load_balancer_hostname
    state_or_province                 = "GA"
    city                              = "Atlanta"
    cloud_server_host_header_override = false
  }

  data_centers {
    latitude                          = 32.77798
    longitude                         = -96.79621
    continent                         = "NA"
    country                           = "US"
    origin_id                         = var.alb_lb_data_centers["origin-b"].origin_id
    percent                           = 0
    cloud_service                     = false
    liveness_hosts                    = var.alb_lb_data_centers["origin-b"].load_balancer_liveness_hosts
    hostname                          = var.alb_lb_data_centers["origin-b"].load_balancer_hostname
    state_or_province                 = "TX"
    city                              = "Dallas"
    cloud_server_host_header_override = false
  }
}

resource "akamai_cloudlets_application_load_balancer" "load_balancer_demo_LB_ID_2" {
  origin_id          = var.alb_load_balancers["load_balancer-b"].id
  origin_description = var.alb_load_balancers["load_balancer-b"].description
  description        = var.alb_load_balancers["load_balancer-b"].version_description
  balancing_type     = var.alb_load_balancers["load_balancer-b"].balancing_type

  data_centers {
    latitude                          = 33.74855
    longitude                         = -84.3915
    continent                         = "NA"
    country                           = "US"
    origin_id                         = var.alb_lb_data_centers["origin-a"].origin_id
    percent                           = 25
    cloud_service                     = false
    liveness_hosts                    = var.alb_lb_data_centers["origin-a"].load_balancer_liveness_hosts
    hostname                          = var.alb_lb_data_centers["origin-a"].load_balancer_hostname
    state_or_province                 = "GA"
    city                              = "Atlanta"
    cloud_server_host_header_override = false
  }

  data_centers {
    latitude                          = 32.77798
    longitude                         = -96.79621
    continent                         = "NA"
    country                           = "US"
    origin_id                         = var.alb_lb_data_centers["origin-b"].origin_id
    percent                           = 75
    cloud_service                     = false
    liveness_hosts                    = var.alb_lb_data_centers["origin-b"].load_balancer_liveness_hosts
    hostname                          = var.alb_lb_data_centers["origin-b"].load_balancer_hostname
    state_or_province                 = "TX"
    city                              = "Dallas"
    cloud_server_host_header_override = false
  }
}

resource "akamai_cloudlets_application_load_balancer_activation" "load_balancer_activation_demo_LB_ID" {
  origin_id = akamai_cloudlets_application_load_balancer.load_balancer_demo_LB_ID.origin_id
  network   = var.env
  version   = akamai_cloudlets_application_load_balancer.load_balancer_demo_LB_ID.version
}

resource "akamai_cloudlets_application_load_balancer_activation" "load_balancer_activation_demo_LB_ID_2" {
  origin_id = akamai_cloudlets_application_load_balancer.load_balancer_demo_LB_ID_2.origin_id
  network   = var.env
  version   = akamai_cloudlets_application_load_balancer.load_balancer_demo_LB_ID_2.version
}

