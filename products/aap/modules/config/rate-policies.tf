resource "akamai_appsec_rate_policy" "origin_error" {
  config_id   = akamai_appsec_configuration.config.config_id
  rate_policy = templatefile("${path.module}/rate-policies/origin_error.json", { nl = var.rate_bypass_list_id })
}

resource "akamai_appsec_rate_policy" "page_view_requests" {
  config_id   = akamai_appsec_configuration.config.config_id
  rate_policy = templatefile("${path.module}/rate-policies/page_view_requests.json", { nl = var.rate_bypass_list_id })
  depends_on = [
    akamai_appsec_rate_policy.origin_error
  ]
}

resource "akamai_appsec_rate_policy" "post_requests" {
  config_id   = akamai_appsec_configuration.config.config_id
  rate_policy = templatefile("${path.module}/rate-policies/post_put_requests.json", { nl = var.rate_bypass_list_id })
  depends_on = [
    akamai_appsec_rate_policy.page_view_requests
  ]
}

resource "akamai_appsec_rate_policy" "forward_requests" {
  config_id   = akamai_appsec_configuration.config.config_id
  rate_policy = templatefile("${path.module}/rate-policies/forward_requests.json", { nl = var.rate_bypass_list_id })
  depends_on = [
    akamai_appsec_rate_policy.post_requests
  ]
}
