variable "contract_id" {
  type        = string
  description = "The contract id that contains your certificate"
}

variable "common_name" {
  type        = string
  description = "The common name on the certificate"
}

variable "sans" {
  type        = list(string)
  description = "A list of san names"
}

variable "secure_network" {
  type        = string
  default     = "standard-tls"
  description = "The network to assign to. Can be either \"standard-tls\" or \"enhanced-tls\""
  validation {
    condition     = var.secure_network == "standard-tls" || var.secure_network == "enhanced-tls"
    error_message = "secure_network must be either 'standard-tls' or 'enhanced-tls'."
  }
}