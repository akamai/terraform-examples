data "akamai_contract" "contract" {
  group_name = var.group_name
}

module "client-lists" {
  source              = "../modules/client-lists"
  client_lists_prefix = substr(var.config_name, 0, 20)
  config_name         = var.config_name
  contract_id         = trimprefix(data.akamai_contract.contract.id, "ctr_")
  group_id            = trimprefix(data.akamai_contract.contract.group_id, "grp_")
}
