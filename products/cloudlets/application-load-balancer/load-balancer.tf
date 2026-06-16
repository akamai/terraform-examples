resource "akamai_cloudlets_application_load_balancer" "load_balancer_demo_LB_ID" {
  origin_id          = "demo_LB_ID"
  origin_description = "New LB 100/0"
  description        = "New version (Cloned from Version 5)"
  balancing_type     = "WEIGHTED"

  data_centers {
    latitude                          = 33.74855
    longitude                         = -84.3915
    continent                         = "NA"
    country                           = "US"
    origin_id                         = var.origin_id_1
    percent                           = 100
    cloud_service                     = false
    liveness_hosts                    = ["origin-a.demo.com"]
    hostname                          = "origin-a.demo.com"
    state_or_province                 = "GA"
    city                              = "Atlanta"
    cloud_server_host_header_override = false
  }

  data_centers {
    latitude                          = 32.77798
    longitude                         = -96.79621
    continent                         = "NA"
    country                           = "US"
    origin_id                         = var.origin_id_2
    percent                           = 0
    cloud_service                     = false
    liveness_hosts                    = ["origin-b.demo.com"]
    hostname                          = "origin-b.demo.com"
    state_or_province                 = "TX"
    city                              = "Dallas"
    cloud_server_host_header_override = false
  }
}

resource "akamai_cloudlets_application_load_balancer" "load_balancer_demo_LB_ID_2" {
  origin_id          = "demo_LB_ID_2"
  origin_description = "New LB 75/25"
  description        = "New version (Cloned from Version 3)"
  balancing_type     = "WEIGHTED"

  data_centers {
    latitude                          = 33.74855
    longitude                         = -84.3915
    continent                         = "NA"
    country                           = "US"
    origin_id                         = var.origin_id_1
    percent                           = 25
    cloud_service                     = false
    liveness_hosts                    = ["origin-a.demo.com"]
    hostname                          = "origin-a.demo.com"
    state_or_province                 = "GA"
    city                              = "Atlanta"
    cloud_server_host_header_override = false
  }

  data_centers {
    latitude                          = 32.77798
    longitude                         = -96.79621
    continent                         = "NA"
    country                           = "US"
    origin_id                         = var.origin_id_2
    percent                           = 75
    cloud_service                     = false
    liveness_hosts                    = ["origin-b.demo.com"]
    hostname                          = "origin-b.demo.com"
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

