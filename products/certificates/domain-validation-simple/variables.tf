variable "hostname" {
  type        = string
  description = "Hostname to include in the certificate"
}

variable "contract_id" {
  type        = string
  description = "Contract ID for certificate creation"
}

variable "enhanced_tls" {
  type        = bool
  description = "Whether to deploy the certificate on the enhanced TLS network"
}