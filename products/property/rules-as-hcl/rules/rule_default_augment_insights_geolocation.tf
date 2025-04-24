
data "akamai_property_rules_builder" "rule_geolocation" {
  rules_v2025_01_13 {
    name                  = "Geolocation"
    comments              = "Receive data about a user's geolocation and connection speed in a request header. If you change cached content based on the values of the X-Akamai-Edgescape request header, contact your account representative."
    criteria_must_satisfy = "all"
    criterion {
      request_type {
        match_operator = "IS"
        value          = "CLIENT_REQ"
      }
    }
    behavior {
      edge_scape {
        enabled = false
      }
    }
  }
}
