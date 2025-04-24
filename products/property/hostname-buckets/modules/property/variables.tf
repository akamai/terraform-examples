variable "contract_id" {
  type        = string
  description = "Contract ID"
}

variable "group_id" {
  type        = string
  description = "Group ID"
}

variable "product_id" {
  type        = string
  default     = "prd_Fresca"
  description = "Name of the required product"
}

variable "include_name" {
  type        = string
  description = "Name for your include"
}

variable "property_name" {
  type        = string
  description = "Name for your property"
}

variable "contacts" {
  type        = list(string)
  description = "A list of contacts who will be contacted when this config is deployed"
}

variable "notes" {
  type        = string
  default     = "Updated by Terraform"
  description = "Change notes for the bucket activation"
}

# For Akamai internal change management process
variable "compliance_record" {
  type = object({
    reason           = string
    peer_reviewed_by = optional(string)
    customer_email   = optional(string)
    unit_tested      = optional(bool)
  })
  validation {
    condition     = var.compliance_record == null ? true : contains(["none", "other", "no_production_traffic", "emergency"], var.compliance_record.reason)
    error_message = "Status must be one of none, no_production_traffic, emergency"
  }
  default = null
}

variable "hostnames" {
  type        = list(string)
  description = "A list of hostnames to include in this configuration"
}

