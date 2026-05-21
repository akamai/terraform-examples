variable "hostnames" {
  type        = list(string)
  description = "The hostnames on our certificate"
}

variable "enrollment_id" {
  type        = string
  description = "The enrollment id of the certificate"
}
