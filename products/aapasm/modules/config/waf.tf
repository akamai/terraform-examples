resource "akamai_appsec_waf_mode" "policy" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  mode               = "ASE_MANUAL"
  depends_on = [
    akamai_appsec_waf_protection.policy
  ]
}

// WAF Attack Group Actions
resource "akamai_appsec_attack_group" "policy_POLICY" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "POLICY"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

resource "akamai_appsec_attack_group" "policy_WAT" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "WAT"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

resource "akamai_appsec_attack_group" "policy_PROTOCOL" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "PROTOCOL"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

resource "akamai_appsec_attack_group" "policy_SQL" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "SQL"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

resource "akamai_appsec_attack_group" "policy_XSS" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "XSS"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

resource "akamai_appsec_attack_group" "policy_CMD" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "CMD"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

resource "akamai_appsec_attack_group" "policy_LFI" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "LFI"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

resource "akamai_appsec_attack_group" "policy_RFI" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "RFI"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

resource "akamai_appsec_attack_group" "policy_PLATFORM" {
  config_id           = akamai_appsec_configuration.config.config_id
  security_policy_id  = akamai_appsec_waf_protection.policy.security_policy_id
  attack_group        = "PLATFORM"
  attack_group_action = "alert"
  depends_on = [
    akamai_appsec_waf_mode.policy
  ]
}

// WAF Rule Actions
// CMD Injection Attack Detected (OS Commands 4)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_950002" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950002"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (OS Commands 5)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_950006" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950006"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Blind Testing)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_950007" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950007"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Server-Side Include (SSI) Attack
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_950011" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950011"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Remote File Inclusion Attack (Common PHP RFI Attacks)
resource "akamai_appsec_rule" "policy_aseweb_attackrfi_950118" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950118"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Directory Traversal and Obfuscation Attempts)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_950203" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950203"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Directory Traversal and Obfuscation Attempts)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_950204" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950204"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Unicode Full/Half Width Abuse Attack Attempt
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_950216" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950216"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Possible URL Redirector Abuse (Off-Domain URL)
resource "akamai_appsec_rule" "policy_aseweb_attackpolicy_950220" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950220"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Tautology Probes 1)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_950902" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "950902"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// HTTP Response Splitting Attack (Header Injection)
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_951910" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "951910"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Fromcharcode Detected)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_958003" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "958003"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (HTML INPUT IMAGE Tag)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_958008" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "958008"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Javascript URL Protocol Handler with "lowsrc" Attribute)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_958023" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "958023"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Style Attribute with 'expression' Keyword)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_958034" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "958034"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Script Tag)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_958051" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "958051"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Common PoC DOM Event Triggers)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_958052" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "958052"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Merge, Execute, Having Probes)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_959070" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "959070"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Built-in Functions, Objects and Keyword Probes 1)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_959073" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "959073"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// PHP Injection Attack (Common Functions)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_959976" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "959976"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// PHP Injection Attack (Configuration Override)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_959977" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "959977"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// GET or HEAD Request with Body Content
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_961011" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "961011"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// POST Request Missing Content-Length Header
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_961012" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "961012"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Invalid HTTP Protocol Version
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_961034" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "961034"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Request Containing Content, but Missing Content-Type header
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_961904" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "961904"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Failed to Parse Request Body for WAF Inspection
resource "akamai_appsec_rule" "policy_aseweb_attackpolicy_961912" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "961912"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// HTTP Range Header: Invalid Last Byte Value
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_968230" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "968230"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// PHP Injection Attack (Opening Tag)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_969151" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "969151"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (URL Protocols)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_973305" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "973305"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Eval/Atob Functions)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_973307" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "973307"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (XSS Unicode PoC String)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_973311" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "973311"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Common PoC Payload)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_973312" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "973312"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (IE XSS Filter Evasion Attempt)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_973335" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "973335"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (SQL Conditional Probes)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981240" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981240"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (SQL Operator and Expression Probes 1)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981242" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981242"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (SQL Operator and Expression Probes 2)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981243" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981243"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Tautology Probes 2)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981244" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981244"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Built-in Functions, Objects and Keyword Probes 3)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981247" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981247"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Built-in Functions, Objects and Keyword Probes 2)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981248" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981248"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Built-in Functions, Objects and Keyword Probes 3)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981251" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981251"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Charset manipulation)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981252" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981252"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Stored Procedure Detected)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981253" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981253"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Time-based Blind Probe)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981254" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981254"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Sysadmin access functions)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981255" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981255"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Merge, Execute, Match Probes)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981256" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981256"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Hex Encoding Detected)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981260" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981260"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (NoSQL MongoDB Probes)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981270" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981270"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (UNION Attempt)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981276" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981276"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (SELECT Statement Anomaly Detected)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981300" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981300"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Known/Default DB Resources Probe)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_981320" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "981320"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Security Scanner/Web Attack Tool Detected (User-Agent)
resource "akamai_appsec_rule" "policy_aseweb_attacktool_999002" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "999002"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Security Scanner/Web Attack Tool Detected (Request Header Names)
resource "akamai_appsec_rule" "policy_aseweb_attacktool_999901" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "999901"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Security Scanner/Web Attack Tool Detected (Filename)
resource "akamai_appsec_rule" "policy_aseweb_attacktool_999902" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "999902"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (GROUP BY/ORDER BY)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000000" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000000"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential Remote File Inclusion (RFI) Attack: Suspicious Off-Domain URL Reference
resource "akamai_appsec_rule" "policy_aseweb_attackrfi_3000004" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000004"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (OS commands with full path)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000005" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000005"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Comment String Termination)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000006" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000006"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Command Injection (Unix File Leakage)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000007" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000007"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Apache Struts Remote Command Execution (OGNL Injection)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000012" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000012"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// System Command Injection (Attacker Toolset Download)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000013" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000013"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Apache Struts Remote Command Execution (OGNL Injection)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000014" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000014"
  rule_action        = "deny"
}

// SQL Injection Attack (Database Timing Query)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000015" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000015"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// MySQL Keywords Anomaly Detection Alert
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000017" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000017"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection (Built-in Functions, Objects and Keyword Probes 4)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000022" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000022"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Apache Struts ClassLoader Manipulation Remote Code Execution
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000023" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000023"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CVE-2014-6271 Bash Command Injection Attack
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000025" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000025"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// PHP Wrapper Attack
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000033" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000033"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Command Injection via the Java Runtime.getRuntime() Method
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000034" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000034"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (JS On-Event Handler)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000037" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000037"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (DOM Window Properties)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000038" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000038"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (DOM Document Methods)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000039" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000039"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Server Side Template Injection (SSTI)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000041" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000041"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// PHP Object Injection Attack Detected
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000056" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000056"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Common Attack Tool Keywords)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000057" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000057"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Apache Struts Remote Command Execution (OGNL Injection)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000058" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000058"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting Attack (Referer Header From OpenBugBounty Website)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000061" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000061"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Apache Struts Remote Command Execution (Deserialization Attack)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000065" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000065"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Deserialization Attack Detected
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000072" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000072"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Attribute Injection 1)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000080" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000080"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Attribute Injection 2)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000081" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000081"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (SmartDetect)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000100" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000100"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Common SQL Database Probes)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000101" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000101"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (Null Byte Detected)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000102" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000102"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// SQL Injection Attack (NoSQL Injection)
resource "akamai_appsec_rule" "policy_aseweb_attacksql_injection_3000103" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000103"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Pandora / DirtJumper DDoS Detection - HTTP GET Attacks
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000108" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000108"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Ruby on Rails YAML Injection Attack
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000109" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000109"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (SmartDetect)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000110" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000110"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Common PoC Probes 1)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000111" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000111"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Common PoC Probes 2)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000112" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000112"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Javascript Mixed Case Obfuscation)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000113" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000113"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (Shell Script Execution)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000114" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000114"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// LOIC 1.1 DoS Detection
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000115" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000115"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (HTML Injection)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000116" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000116"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// HULK DoS Attack Tool Detected
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000117" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000117"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// DirtJumper DDoS Detection - HTTP POST Attacks
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000118" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000118"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (HTML Context Breaking)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000119" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000119"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Common OS Files 1)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_3000120" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000120"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Common OS Files 2)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_3000121" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000121"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Long Directory Traversal)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_3000122" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000122"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Directory Traversal Obfuscation)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_3000123" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000123"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Common OS Files 3)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_3000124" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000124"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Common OS Files 4)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_3000125" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000125"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Common OS Files 5)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_3000126" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000126"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Local File Inclusion (LFI) Attack (Nul Byte Detected)
resource "akamai_appsec_rule" "policy_aseweb_attacklfi_3000127" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000127"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Cross-site Scripting (XSS) Attack (HTML Entity Named Encoding Detected)
resource "akamai_appsec_rule" "policy_aseweb_attackxss_3000128" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000128"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Pandora DDoS Detection - HTTP POST Attacks
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000129" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000129"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Remote File Inclusion Attack (Well-Known RFI Testing/Attack URL)
resource "akamai_appsec_rule" "policy_aseweb_attackrfi_3000130" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000130"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Remote File Inclusion Attack (Well-Known RFI Filename)
resource "akamai_appsec_rule" "policy_aseweb_attackrfi_3000131" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000131"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Detect Attempts to Access the Wordpress Pingback API
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000132" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000132"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Apache Commons FileUpload and Apache Tomcat DoS
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000133" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000133"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// XML External Entity (XXE) Attack
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000134" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000134"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// HTTP.sys Remote Code Execution Vulnerability Attack Detected (CVE-2015-1635)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000135" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000135"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential Account Brute Force Guessing via Wordpress XML-RPC API authenticated methods
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000136" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000136"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Detected LOIC / HOIC client request based on query string
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000137" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000137"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Detected ARDT client request
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000138" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000138"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Detect Attempts to Access the Wordpress system.multicall XML-RPC API
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000139" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000139"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Avzhan Bot DDOS Detection
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000140" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000140"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (OS Commands 1)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000141" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000141"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (OS Commands 2)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000142" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000142"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Bash with -c flag)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000143" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000143"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Uname with -a flag)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000144" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000144"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Cmd.exe with "dir" command)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000145" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000145"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (/bin/sh with pipe "|")
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000146" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000146"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Shellshock Variant)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000147" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000147"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Ping Beaconing)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000148" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000148"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Common Uname PoC)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000149" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000149"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Sleep with Bracketed IFS Obfuscation)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000150" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000150"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Bracketed IFS Argument Separator Detected)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000151" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000151"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (IP Address Detected)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000152" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000152"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected
resource "akamai_appsec_rule" "policy_aseweb_attackcmdi_3000153" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000153"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Common PHP Function Detected)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000154" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000154"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (Php/Data Filter Detected)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000155" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000155"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// CMD Injection Attack Detected (PHP High-Risk Functions)
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000156" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000156"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Mirai / Kaiten DDoS Detection - HTTP Attacks
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000157" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000157"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Security Scanner/Web Attack Tool Detected (PoC Testing Payload)
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000160" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000160"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Server-Side Request Forgery (SSRF) Detected (Beacon Domain Testing)
resource "akamai_appsec_rule" "policy_aseweb_attackwat_3000161" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000161"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Mirai/Kaiten Bot DDOS Detection - Bogus Search Engine Referer
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000162" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000162"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Application Layer Hash DoS Attack
resource "akamai_appsec_rule" "policy_aseweb_attacktool_3000164" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000164"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential Wordpress Javascript DoS Attack (CVE-2018-6389)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000166" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000166"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential Drupal Attack (CVE-2018-7600)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000167" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000167"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Edge Side Inclusion (ESI) injection Attack
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000168" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000168"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Webshell/Backdoor File Upload Attempt
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000171" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000171"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential HTTP Desync Attack: Invalid Transfer-Encoding Header Value
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_3000173" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000173"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential HTTP Desync Attack: HTTP Request Smuggling Detect in Request Body
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_3000174" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000174"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential HTTP Desync Attack: Transfer-Encoding Header Name Obfuscation
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_3000175" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000175"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential HTTP Desync Attack: Transfer-Encoding Header in Request Body
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_3000176" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000176"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Potential HTTP Desync Attack: Chunked header value with invalid Header Name
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_3000177" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000177"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Microsoft Sharepoint Remote Command Execution (Deserialization Attack)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000179" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000179"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Partial Request Body Inspection Warning - Request Body is larger than the configured inspection limit
resource "akamai_appsec_rule" "policy_aseweb_attackpolicy_3000180" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000180"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Possible MS Exchange/OWA Attack Detected (CVE-2021-26855)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000183" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000183"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Possible MS Exchange/OWA Attack Detected (CVE-2021-27065)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000184" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000184"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Confluence/OGNLi Attack Detected (CVE-2021-26084)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000185" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000185"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// PowerCMS Movable Type Attack Detected (CVE-2021-20837)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000186" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000186"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Magento vulnerability (Callback function) Attack Detected (CVE-2022-24086 CVE-2022-24087)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000187" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000187"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Magento vulnerability (validate_rules) Attack Detected (CVE-2022-24086 CVE-2022-24087)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000188" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000188"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// ThinkPHP RCE (CVE-2018-20062) Attack Detected
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000189" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000189"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// XML External Entity (XXE) XInclude Attack
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000190" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000190"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// .NET Deserialization Attack
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000191" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000191"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// HTTP Hop-By-Hop Header Abuse Attack
resource "akamai_appsec_rule" "policy_aseweb_attackprotocol_3000192" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000192"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Oracle ADF Faces Deserialization Attack Detected (CVE-2022-21445)
resource "akamai_appsec_rule" "policy_aseweb_attackcmdi_3000195" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000195"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Unix OS Command Execution
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000196" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000196"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Command Injection via the ASP.NET Process.Start() Method
resource "akamai_appsec_rule" "policy_aseweb_attackcmd_injection_3000197" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000197"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Possible RCE on MS Exchange Detected (CVE-2022-41040 CVE-2022-41082)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000198" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000198"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}

// Webshell Activity on Microsoft Exchange (Related to CVE-2022-41040 CVE-2022-41082)
resource "akamai_appsec_rule" "policy_aseweb_attackplatform_3000199" {
  config_id          = akamai_appsec_configuration.config.config_id
  security_policy_id = akamai_appsec_waf_protection.policy.security_policy_id
  rule_id            = "3000199"
  rule_action        = "alert"
  depends_on = [
    akamai_appsec_attack_group.policy_POLICY,
    akamai_appsec_attack_group.policy_WAT,
    akamai_appsec_attack_group.policy_PROTOCOL,
    akamai_appsec_attack_group.policy_SQL,
    akamai_appsec_attack_group.policy_XSS,
    akamai_appsec_attack_group.policy_CMD,
    akamai_appsec_attack_group.policy_LFI,
    akamai_appsec_attack_group.policy_RFI,
    akamai_appsec_attack_group.policy_PLATFORM
  ]
}



