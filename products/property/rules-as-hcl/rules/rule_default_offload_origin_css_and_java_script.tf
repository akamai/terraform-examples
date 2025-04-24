
data "akamai_property_rules_builder" "rule_css_and_java_script" {
  rules_v2025_01_13 {
    name                  = "CSS and JavaScript"
    comments              = "Override the default caching behavior for CSS and JavaScript"
    criteria_must_satisfy = "any"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["css", "js", ]
      }
    }
    behavior {
      caching {
        behavior        = "MAX_AGE"
        must_revalidate = false
        ttl             = "7d"
      }
    }
  }
}
