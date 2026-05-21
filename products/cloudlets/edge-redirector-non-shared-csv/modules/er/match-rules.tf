data "akamai_cloudlets_edge_redirector_match_rule" "match_rules_er" {
  dynamic "match_rules" {
    for_each = tomap({ for entry in csvdecode(var.csv) : entry.ruleName => entry })
    content {
      name             = match_rules.value.ruleName
      use_relative_url = match_rules.value.useRelativeUrl
      status_code      = match_rules.value.statusCode
      redirect_url     = match_rules.value.redirectURL
      match_url        = match_rules.value.matchURL
    }
  }
}

