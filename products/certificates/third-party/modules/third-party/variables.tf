variable "config_section" {
  type        = string
  description = "Account ID. Used for multi account tenant only"
}

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

variable "tech_contact" {
  description = "An object containing tech contact details for the certificate"
  type = object({
    first_name       = string
    last_name        = string
    organization     = string
    email            = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })
}

variable "admin_contact" {
  description = "An object containing admin contact details for the certificate"
  type = object({
    first_name       = string
    last_name        = string
    organization     = string
    email            = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })
}

variable "organization" {
  description = "An object containing organization details for the certificate"
  type = object({
    organization     = string
    unit             = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })
}
