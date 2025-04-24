variable "contract_id" {
  type        = string
  description = "Contract ID"
}

variable "group_id" {
  type        = number
  description = "Group ID"
}

variable "property_name" {
  type        = string
  description = "Name for your property"
}

variable "hostname" {
  type        = string
  description = "hostname for your property"
}

variable "product_id" {
  type        = string
  default     = "Fresca"
  description = "Product ID. Defaults to Ion Standard"
}

variable "rule_format" {
  type        = string
  default     = "v2025-01-13"
  description = "Static rule format schema. This is required when using HCL rules and must match the data source format."
}

variable "default_origin" {
  type        = string
  description = "Default origin server for all properties"
}

variable "td_region" {
  type        = string
  description = "Region (map) for Tiered Distribution behaviour. Only applies if network is Standard TLS. Options are: CH2, CHAPAC, CHEU2, CHEUS2, CHWUS2, CHCUS2, CHAUS"
  default     = "CH2"
}

variable "sure_route_test_object" {
  type        = string
  description = "Test object path for SureRoute"
  default     = "/akamai/testobject.html"
}

variable "email" {
  type        = string
  description = "Notification email address for activation command"
}

variable "notes" {
  type        = string
  description = "Version notes for property changes"
  default     = "Updated by Terraform"
}

variable "activate_latest_on_staging" {
  type    = bool
  default = true
}

variable "activate_latest_on_production" {
  type    = bool
  default = false
}
variable "include_ivm_images" {
  type        = bool
  description = "Boolean to control inclusion of Image Manager (Images) behaviour"
  default     = false
}

variable "ivm_images_policyset" {
  type        = string
  description = "IVM (Images) policy set ID from IVM module. If include_ivm_images is true then this is required."
  default     = ""
}
