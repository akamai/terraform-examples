
data "akamai_property_rules_builder" "rule_files" {
  rules_v2025_01_13 {
    name                  = "Files"
    comments              = "Override the default caching behavior for files. Files containing Personal Identified Information (PII) should require Edge authentication or not be cached at all."
    criteria_must_satisfy = "any"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["pdf", "doc", "docx", "odt", ]
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
