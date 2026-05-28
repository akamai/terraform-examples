# Global Parameters
variable "group_name" {
  type        = string
  description = "The name of the Akamai group"
}

# Certificate
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
  default     = "STANDARD_TLS"
  description = "The network to assign to. Can be either \"STANDARD_TLS\" or \"ENHANCED_TLS\""
  validation {
    condition     = var.secure_network == "STANDARD_TLS" || var.secure_network == "ENHANCED_TLS"
    error_message = "secure_network must be either 'STANDARD_TLS' or 'ENHANCED_TLS'."
  }
}

# Property
variable "property_name" {
  type        = string
  description = "The name of the property to create and associate with the certificate"
}

variable "hostname" {
  type        = string
  description = "The hostname to associate with the property"
}

variable "edge_hostname" {
  type        = string
  description = "The edge hostname to associate with the property"
}

variable "contacts" {
  type        = list(string)
  description = "A list of email addresses to notify when changes are made to the property"
}