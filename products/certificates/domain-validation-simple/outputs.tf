output "certificate_id" {
  value = akamai_cps_dv_enrollment.certificate.id
}

resource "local_file" "dns_challenges_json" {
  content  = jsonencode(akamai_cps_dv_enrollment.certificate.dns_challenges)
  filename = "dns_challenges.json"
}
