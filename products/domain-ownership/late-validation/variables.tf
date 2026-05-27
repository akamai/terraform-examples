variable "contract_id" {
  type        = string
  description = "The ID of the Akamai contract."
}

variable "group_id" {
  type        = string
  description = "The ID of the Akamai group."
}

variable "property_name" {
  type        = string
  description = "The name of the property."
}

variable "product_id" {
  type    = string
  default = "prd_Fresca"
}

variable "contact" {
  type        = list(string)
  description = "List of email addresses to notify on property activation."
  default     = ["noreply@akamai.com"]
}

variable "hostnames" {
  description = "Map of hostnames to their cert_provisioning_type. Key is cname_from; cname_to is derived as <hostname>.edgekey.net."
  type = map(object({
    cert_provisioning_type = string
  }))
  validation {
    condition = alltrue([
      for hostname, config in var.hostnames :
      can(regex("^([a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,}$", hostname))
    ])
    error_message = "Each key in the hostnames map must be a valid hostname (only letters, numbers, dots, and hyphens are allowed). Example: 'www.example-demo.com', 'www-2.example-demo.com', 'www.example.com'."
  }
  validation {
    condition = alltrue([
      for hostname, config in var.hostnames :
      contains(["CPS_MANAGED", "DEFAULT", "CCM"], config.cert_provisioning_type)
    ])
    error_message = "cert_provisioning_type must be one of: CPS_MANAGED, DEFAULT, CCM."
  }
}

variable "activation_network" {
  type    = string
  default = "STAGING"
}

variable "enable_cert_validation" {
  type    = bool
  default = true
}
