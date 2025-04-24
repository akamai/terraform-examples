resource "akamai_cps_dv_validation" "validation" {
  enrollment_id                          = var.enrollment_id
  sans                                   = var.hostnames
  acknowledge_post_verification_warnings = true
  timeouts {
    default = "1h"
  }
}
