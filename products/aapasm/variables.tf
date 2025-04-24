variable "notes" {
  type        = string
  description = "Execution notes, used to update certain elements"
}

variable "hostname" {
  type        = string
  description = "Hostname to include in configs/properties"
}

variable "contract_id" {
  type = string
}

variable "group_id" {
  type = string
}

variable "config_name" {
  type = string
}

variable "config_description" {
  type = string
}

variable "email" {
  type = string
}

variable "policy_name" {
  type    = string
  default = "default"
}

variable "policy_prefix" {
  type    = string
  default = "DEF1"
}

variable "ip_block_list_id" {
  type        = string
  description = "IP Block List IPs Network List ID"
}

variable "ip_block_list_exceptions_id" {
  type        = string
  description = "IP Block List Exceptions IPs Network List ID"
}

variable "geo_block_list_id" {
  type        = string
  description = "Geo Block List Geos Network List ID"
}

variable "security_bypass_list_id" {
  type        = string
  description = "Security Bypass List IPs Network List ID"
}

variable "rate_bypass_list_id" {
  type        = string
  description = "Rate Control Bypass List IPs Network List ID"
}

variable "pragma_exceptions_id" {
  type        = string
  description = "Pragma Removal Exceptions IPs Network List ID"
}

variable "enable_siem" {
  type        = bool
  default     = true
  description = "On/Off option for SIEM feature"
}

variable "enable_client_rep" {
  type        = bool
  default     = true
  description = "On/Off option for Client Reputation feature"
}

variable "enable_slow_post" {
  type        = bool
  default     = true
  description = "On/Off option for Slow Post feature"
}
