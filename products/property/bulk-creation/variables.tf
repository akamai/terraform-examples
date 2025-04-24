# -------------------------------------------------
# Common Variables 
# -------------------------------------------------

variable "group_name" {
  description = "Akamai Group Name"
  type        = string
}

variable "product_id" {
  description = "Akamai Property Product ID"
  type        = string
  default     = "Fresca"
}

# -------------------------------------------------
# Edge Hostname
# -------------------------------------------------

variable "edge_hostname_ip_behavior" {
  description = "Akamai Edge Hostname IP behavior"
  type        = string
  default     = "IPV6_COMPLIANCE"
}

variable "certificate" {
  description = "Akamai Certificate Enrollment ID"
  type        = number
}

# -------------------------------------------------
# Property
# -------------------------------------------------

variable "properties" {
  type = map(object({
    cpcode_name     = string
    origin_hostname = string
    hostnames       = list(string)
    edge_hostname   = string
  }))
}

variable "domain" {
  description = "Domain for all the properties"
  type        = string
}

variable "version_notes" {
  type        = string
  description = "Version Notes for the Property"
}

variable "email" {
  type        = string
  description = "Notification email"
}

variable "activate_property_on_staging" {
  type = bool
}

variable "activate_property_on_production" {
  type = bool
}

