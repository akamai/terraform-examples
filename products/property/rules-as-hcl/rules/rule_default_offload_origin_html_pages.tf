
data "akamai_property_rules_builder" "rule_html_pages" {
  rules_v2025_01_13 {
    name                  = "HTML pages"
    comments              = "Override the default caching behavior for HTML pages cached on edge servers."
    criteria_must_satisfy = "all"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["html", "htm", "php", "jsp", "aspx", "EMPTY_STRING", ]
      }
    }
    behavior {
      caching {
        behavior = "NO_STORE"
      }
    }
    behavior {
      cache_key_query_params {
        behavior    = "IGNORE"
        exact_match = true
        parameters  = ["gclid", "fbclid", "utm_source", "utm_campaign", "utm_medium", "utm_content", ]
      }
    }
  }
}
