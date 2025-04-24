resource "akamai_appsec_configuration" "config" {
  name        = var.config_name
  description = var.notes
  contract_id = var.contract_id
  group_id    = trimprefix(var.group_id, "grp_")
  host_names  = var.hostnames
  lifecycle {
    ignore_changes = [
      description,
    ]
  }
}
