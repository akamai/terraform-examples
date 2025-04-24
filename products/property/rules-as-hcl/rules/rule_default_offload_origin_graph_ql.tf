
data "akamai_property_rules_builder" "rule_graph_ql" {
  rules_v2025_01_13 {
    name                  = "GraphQL"
    comments              = "Define when your GraphQL queries should be cached."
    criteria_must_satisfy = "all"
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "MATCHES_ONE_OF"
        normalize            = false
        values               = ["/graphql", ]
      }
    }
    behavior {
      graphql_caching {
        enabled = false
      }
    }
  }
}
