variable "group_name" {
  type        = string
  description = "The name of the Akamai group."
}

variable "certificate_name" {
  type        = string
  description = "The name of the client certificate to be created in the Akamai mTLS keystore."

  validation {
    condition     = !contains(split("", var.certificate_name), " ") && length(var.certificate_name) >= 1 && length(var.certificate_name) <= 64
    error_message = "The certificate name must be between 1 and 64 characters long and cannot contain blank spaces."
  }
}

variable "emails" {
  type        = list(string)
  description = "A list of email addresses to notify when changes are made to the GTM domain."
}

variable "product_id" {
  type    = string
  default = "prd_Fresca"
}

variable "property_name" {
  type        = string
  description = "The name of the Akamai property."
}

variable "hostname" {
  type        = string
  description = "The hostname for the Akamai property."
}

variable "edge_hostname" {
  type        = string
  description = "The hostname for the Akamai property. Include the edgekey.net or edgesuite.net suffix."
}

variable "network" {
  type        = string
  description = "The network to which the property should be activated. Valid values are STAGING or PRODUCTION."
  default     = "STAGING"
}