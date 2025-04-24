
data "akamai_property_rules_builder" "rule_fonts" {
  rules_v2025_01_13 {
    name                  = "Fonts"
    comments              = "Override the default caching behavior for fonts."
    criteria_must_satisfy = "any"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["eot", "woff", "woff2", "otf", "ttf", ]
      }
    }
    behavior {
      caching {
        behavior        = "MAX_AGE"
        must_revalidate = false
        ttl             = "30d"
      }
    }
  }
}
