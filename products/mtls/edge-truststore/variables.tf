variable "group_name" {
  type        = string
  description = "The name of the Akamai group."
}

variable "certificate_name" {
  type        = string
  description = "The name of the client certificate to be created in the Akamai mTLS Truststore."
}

variable "certificate_description" {
  type        = string
  description = "The description of the client certificate to be created in the Akamai mTLS Truststore."
}

variable "certificate_version_description" {
  type        = string
  description = "The version description of the client certificate to be created in the Akamai mTLS Truststore."
}

variable "common_name" {
  type        = string
  description = "The name of the client certificate to be created in CPS."
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

variable "network" {
  type        = string
  description = "The network to which the property should be activated. Valid values are STAGING or PRODUCTION."
  default     = "STAGING"
}