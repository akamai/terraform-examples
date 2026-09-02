variable "hostname" {
  type        = string
  description = "Hostname to include in the certificate"
}

variable "sans" {
  type        = list(string)
  description = "SANs to include in the certificate"
}

variable "dns_zone" {
  type        = string
  description = "DNS zone for the hostname"
}

variable "contract_id" {
  type        = string
  description = "Contract ID for certificate creation"
}

variable "enhanced_tls" {
  type        = bool
  description = "Whether to deploy the certificate on the enhanced TLS network"
}