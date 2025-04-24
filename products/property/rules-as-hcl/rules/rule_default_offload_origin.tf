
data "akamai_property_rules_builder" "rule_offload_origin" {
  rules_v2025_01_13 {
    name                  = "Offload origin"
    comments              = "Control the settings related to caching content at the edge and in the browser. As a result, fewer requests go to your origin, fewer bytes leave your data centers, and your assets are closer to your users."
    criteria_must_satisfy = "all"
    behavior {
      caching {
        behavior = "NO_STORE"
      }
    }
    behavior {
      tiered_distribution {
        enabled                 = true
        tiered_distribution_map = var.td_region
      }
    }
    behavior {
      validate_entity_tag {
        enabled = false
      }
    }
    behavior {
      remove_vary {
        enabled = false
      }
    }
    behavior {
      cache_error {
        enabled        = true
        preserve_stale = true
        ttl            = "10s"
      }
    }
    behavior {
      cache_key_query_params {
        behavior = "INCLUDE_ALL_ALPHABETIZE_ORDER"
      }
    }
    behavior {
      prefresh_cache {
        enabled     = true
        prefreshval = 90
      }
    }
    behavior {
      downstream_cache {
        allow_behavior = "LESSER"
        behavior       = "ALLOW"
        send_headers   = "CACHE_CONTROL"
        send_private   = false
      }
    }
    children = [
      data.akamai_property_rules_builder.rule_css_and_java_script.json,
      data.akamai_property_rules_builder.rule_fonts.json,
      data.akamai_property_rules_builder.rule_images.json,
      data.akamai_property_rules_builder.rule_files.json,
      data.akamai_property_rules_builder.rule_other_static_objects.json,
      data.akamai_property_rules_builder.rule_html_pages.json,
      data.akamai_property_rules_builder.rule_redirects.json,
      data.akamai_property_rules_builder.rule_post_responses.json,
      data.akamai_property_rules_builder.rule_graph_ql.json,
      data.akamai_property_rules_builder.rule_uncacheable_objects.json,
    ]
  }
}
