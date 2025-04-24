data "akamai_property_rules_builder" "property_rule_image_and_video_manager_-_images-" {
  rules_v2023_05_30 {
    name                  = "Image and Video Manager (Images)"
    comments              = "Enable Scale for Mobile to serve the best available size for the requesting device. (Careful testing is highly recommended.) Enable Use Best File Type to serve the image format that works best for the requesting client. To configure breakpoint widths, derivative image quality, and artistic transformations, save and activate this configuration; then, create policies for this policy set via either Image and Video Manager Policy Manager or the OPEN Image and Video Manager API."
    criteria_must_satisfy = "all"
    criterion {
      file_extension {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        values               = ["jpg", "gif", "jpeg", "png", "imviewer", ]
      }
    }
    behavior {
      caching {
        behavior        = "MAX_AGE"
        must_revalidate = false
        ttl             = "30d"
      }
    }
    behavior {
      image_manager {
        api_reference_title     = ""
        apply_best_file_type    = true
        enabled                 = true
        resize                  = false
        settings_title          = ""
        super_cache_region      = "US"
        traffic_title           = ""
        use_existing_policy_set = true
        policy_set              = var.ivm_images_policyset
        cp_code_original {
          id = var.ivm_images_pristine_cp_code
        }
        cp_code_transformed {
          id = var.ivm_images_derivative_cp_code
        }
      }
    }
  }
}