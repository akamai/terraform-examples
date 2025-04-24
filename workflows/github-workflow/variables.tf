# -------------------------------------------------
# Environment variables (TF_VAR_*)
# -------------------------------------------------
variable "akamai_client_secret" {
  description = "Akamai client_secret API credential"
  type        = string
  default     = ""
}
variable "akamai_host" {
  description = "Akamai host API credential"
  type        = string
  default     = ""
}
variable "akamai_access_token" {
  description = "Akamai access_token API credential"
  type        = string
  default     = ""
}
variable "akamai_client_token" {
  description = "Akamai client_token API credential"
  type        = string
  default     = ""
}
variable "akamai_account_key" {
  description = "Akamai Account Key"
  type        = string
  default     = ""
}

# -------------------------------------------------
# Variables in common to all environments
# -------------------------------------------------
variable "config_section" {
  description = "Section for the credentials in the .edgerc"
  type        = string
  default     = "default"
}

variable "contract_id" {
  description = "Akamai Contract ID"
  type        = string
  default     = "ctr_1-1NC95D"
}

variable "group_name" {
  description = "Akamai Access Group Name"
  type        = string
  default     = "Demos - Templates"
}

variable "product_id" {
  description = "Property Product ID"
  type        = string
  default     = "prd_Download_Delivery"
}

variable "emails" {
  description = "List of Emails for Notifications"
  type        = list(string)
  default     = ["noreply@akamai.com"]
}

# -------------------------------------------------
# Property Variables
# -------------------------------------------------
variable "property_name" {
  description = "Property Name"
  type        = string
  default     = ""
}

variable "hostname" {
  description = "Property Hostname"
  type        = string
  default     = ""
}

variable "origin_hostname" {
  description = "Origin Server Hostname"
  type        = string
  default     = ""
}

variable "edge_hostname" {
  description = "Akamai Edge Hostname"
  type        = string
  default     = ""
}

variable "cp_code_name" {
  description = "Name for the CP Code to Create"
  type        = string
  default     = "CP Code"
}

variable "version_notes" {
  description = "Notes for the property version and activations"
  type        = string
  default     = "Tests Performed Locally"
}

variable "activate_latest_on_staging" {
  description = "Activate the Property to Staging"
  type        = bool
  default     = true
}

variable "activate_latest_on_production" {
  description = "Activate the Property to Production"
  type        = bool
  default     = true
}

# -------------------------------------------------
# Python Script for CAM Values
# -------------------------------------------------
variable "cam_key_id" {
  description = "Cloud Access Manager Key ID"
  type        = string
  default     = ""
}

variable "cam_key_guid" {
  description = "Cloud Access Manager Key GUID"
  type        = string
  default     = ""
}
