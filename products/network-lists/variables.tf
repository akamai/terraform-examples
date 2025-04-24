variable "contract_id" {
  type        = string
  description = "Contract ID for property/config creation"
}

variable "group_id" {
  type        = string
  description = "Group ID for property/config creation"
}

variable "email" {
  type        = string
  description = "Email address used for activations"
}

variable "prefix" {
  type        = string
  description = "Prefix for list names"
}

variable "ip_block_list" {
  type        = list(any)
  description = "IP Block List IPs"
  default     = []
}

variable "ip_block_list_exceptions" {
  type        = list(any)
  description = "IP Block List Exceptions IPs"
  default     = []
}

variable "geo_block_list" {
  type        = list(any)
  description = "Geo Block List Geos"
  default     = []
}

variable "security_bypass_list" {
  type        = list(any)
  description = "Security Bypass List IPs"
  default     = []
}

variable "rate_bypass_list" {
  type        = list(any)
  description = "Rate Control Bypass List IPs"
  default     = []
}

variable "pragma_exceptions" {
  type        = list(any)
  description = "Pragma Removal Exceptions IPs"
  default     = []
}
