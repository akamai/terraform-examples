/*
* Here's how to add many hostnames to a property that are 
* stored in a list
*/

resource "akamai_property" "lab" {
  name        = var.property_name
  contract_id = data.akamai_contract.contract.id
  group_id    = data.akamai_group.group.id
  product_id  = "prd_Fresca"
  dynamic "hostnames" {
    for_each = toset(var.hostnames)
    content {
      cname_from             = hostnames.value
      cname_to               = akamai_edge_hostname.lab-edgesuite-net.edge_hostname
      cert_provisioning_type = "CPS_MANAGED" // Or "DEFAULT"
    }
  }
  rule_format = "latest"
  rules       = data.akamai_property_rules_template.rules.json
}
