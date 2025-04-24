
data "akamai_property_rules_builder" "rule_other_static_objects" {
  rules_v2025_01_13 {
    name                  = "Other static objects"
    comments              = "Override the default caching behavior for other static objects."
    criteria_must_satisfy = "any"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["aif", "aiff", "au", "avi", "bin", "bmp", "cab", "carb", "cct", "cdf", "class", "dcr", "dtd", "exe", "flv", "gcf", "gff", "grv", "hdml", "hqx", "ini", "mov", "mp3", "nc", "pct", "ppc", "pws", "swa", "swf", "txt", "vbs", "w32", "wav", "midi", "wbmp", "wml", "wmlc", "wmls", "wmlsc", "xsd", "zip", "pict", "tif", "tiff", "mid", "jxr", "jar", ]
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
