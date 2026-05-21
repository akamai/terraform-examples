module "example" {
  source                = "../modules/er"
  csv                   = file(var.csv)
  group_id              = var.group_id
  policy_name           = var.policy_name
  associated_properties = var.associated_properties
  env                   = var.env
}
