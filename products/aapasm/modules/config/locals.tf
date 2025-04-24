locals {
  siem_count       = (var.enable_siem == true) ? 1 : 0
  client_rep_count = (var.enable_client_rep == true) ? 1 : 0
  slow_post_count  = (var.enable_slow_post == true) ? 1 : 0
}