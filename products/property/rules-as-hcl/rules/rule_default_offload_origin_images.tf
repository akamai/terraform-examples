
data "akamai_property_rules_builder" "rule_images" {
  rules_v2025_01_13 {
    name                  = "Images"
    comments              = "Override the default caching behavior for images."
    criteria_must_satisfy = "any"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["jpg", "jpeg", "png", "gif", "webp", "jp2", "ico", "svg", "svgz", ]
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
