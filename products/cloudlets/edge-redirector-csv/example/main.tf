module "example" {
  source                = "../modules/er"
  csv                   = file("redirects.csv")
  group_id              = "19293"
  policy_name           = "ertest_tf"
  associated_properties = ["test.example.org", "test2.example.org"]
  #env = "production"
}
