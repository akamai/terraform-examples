
resource "akamai_appsec_match_target" "match" {
  config_id = akamai_appsec_configuration.config.config_id
  match_target = jsonencode(
    {
      "bypassNetworkLists" : [
        {
          "id" : "${var.security_bypass_list_id}",
          "listType" : "NL",
          "type" : "IP"
        }
      ],
      "defaultFile" : "NO_MATCH",
      "filePaths" : [
        "/*"
      ],
      "hostnames" : "${var.hostnames}",
      "isNegativeFileExtensionMatch" : false,
      "isNegativePathMatch" : false,
      "securityPolicy" : {
        "policyId" : "${akamai_appsec_security_policy.policy.security_policy_id}"
      },
      "sequence" : 0,
      "type" : "website"
    }
  )
}
