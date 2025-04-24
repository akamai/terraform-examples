/* 
* This snippet shows how you might add a rule to your rules.tf which sets a 
* different origin and cpcode for each hostname
*/

# The input variable in this example is a map of strings
# where the key is the hostname and the value is the origin hostname
variable "hostname" {
  type = map(string)
}

# This would probably live alongside your akamai_property resource
# This will create a CP Code for each hostname
resource "akamai_cp_code" "cp_code" {
  for_each    = var.hostname
  contract_id = var.contract_id
  group_id    = var.group_id
  name        = each.key
  product_id  = "prd_Fresca"
}

# The following datasources would live in "rules.tf" alongside your other Property Manager rules
# and be linked into the rule tree appropriately
# We use a for loop to link each instance of "sports_rule_sports" to the parent "sports_rule_other_origins"
data "akamai_property_rules_builder" "sports_rule_other_origins" {
  rules_v2023_05_30 {
    name                  = "Other Origins"
    criteria_must_satisfy = "all"
    children = [
      for key, value in data.akamai_property_rules_builder.sports_rule_sports : value.json
    ]
  }
}

# Use a for_each loop to create an instance of "sports_rule_sports" for each hostname
data "akamai_property_rules_builder" "sports_rule_sports" {
  for_each = var.hostname
  rules_v2023_05_30 {
    name                  = each.key
    criteria_must_satisfy = "all"
    criterion {
      hostname {
        match_operator = "IS_ONE_OF"
        values         = [each.key]
      }
    }
    behavior {
      origin {
        cache_key_hostname               = "ORIGIN_HOSTNAME"
        compress                         = true
        custom_valid_cn_values           = ["{{Origin Hostname}}", "{{Forward Host Header}}", ]
        enable_true_client_ip            = true
        forward_host_header              = "REQUEST_HOST_HEADER"
        hostname                         = each.value
        http_port                        = 80
        https_port                       = 443
        origin_certificate               = ""
        origin_certs_to_honor            = "STANDARD_CERTIFICATE_AUTHORITIES"
        origin_sni                       = true
        origin_type                      = "CUSTOMER"
        ports                            = ""
        standard_certificate_authorities = ["akamai-permissive", ]
        true_client_ip_client_setting    = false
        true_client_ip_header            = "True-Client-IP"
        verification_mode                = "CUSTOM"
      }
    }
    behavior {
      cp_code {
        value {
          id = akamai_cp_code.cp_code[each.key].id
        }
      }
    }
  }
}
