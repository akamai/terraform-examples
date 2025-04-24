resource "akamai_botman_bot_management_settings" "bot_management_settings" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_security_policy.policy.security_policy_id
  bot_management_settings = jsonencode(
    {
      "addAkamaiBotHeader" : true,
      "enableActiveDetections" : false,
      "enableBotManagement" : true,
      "enableBrowserValidation" : true,
      "removeBotManagementCookies" : true,
      "thirdPartyProxyServiceInUse" : false
    }
  )
}

resource "akamai_botman_javascript_injection" "javascript_injection" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_security_policy.policy.security_policy_id
  javascript_injection = jsonencode(
    {
      "injectJavaScript" : "NEVER",
      "rules" : []
    }
  )
}