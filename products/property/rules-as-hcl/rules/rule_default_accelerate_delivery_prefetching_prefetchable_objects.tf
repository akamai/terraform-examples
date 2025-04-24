
data "akamai_property_rules_builder" "rule_prefetchable_objects" {
  rules_v2025_01_13 {
    name                  = "Prefetchable objects"
    comments              = "Define which resources should be prefetched."
    criteria_must_satisfy = "all"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["css", "js", "jpg", "jpeg", "jp2", "png", "gif", "svg", "svgz", "webp", "eot", "woff", "woff2", "otf", "ttf", ]
      }
    }
    behavior {
      prefetchable {
        enabled = true
      }
    }
  }
}
