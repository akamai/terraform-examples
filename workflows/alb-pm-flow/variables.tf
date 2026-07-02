variable "group_name" {
  type        = string
  description = "Akamai group name"
}

variable "property_name" {
  type        = string
  description = "Property name"
}

variable "hostname" {
  type        = string
  description = "Hostname for the property"
}

variable "product_id" {
  type        = string
  default     = "Fresca"
  description = "Property Manager product ID. Defaults to Ion Standard (Fresca)"
}

variable "rule_format" {
  type        = string
  default     = "v2025-01-13"
  description = "Static rule format schema. Must match the data source format in rules-as-hcl module"
}

variable "default_origin" {
  type        = string
  description = "Default origin server hostname"
}

variable "sure_route_test_object" {
  type        = string
  default     = "/akamai/testobject.html"
  description = "Test object path for SureRoute"
}

variable "td_region" {
  type        = string
  default     = "CH2"
  description = "Region for Tiered Distribution. Options: CH2, CHAPAC, CHEU2, CHEUS2, CHWUS2, CHCUS2, CHAUS"
}

variable "contacts" {
  type        = list(string)
  description = "Notification email contacts for property activations"
}

variable "notes" {
  type        = string
  default     = "Managed by Terraform"
  description = "Version notes for property changes"
}

variable "activate_latest_on_staging" {
  type    = bool
  default = false
}

variable "activate_latest_on_production" {
  type    = bool
  default = false
}

######################################
# ALB variables
######################################
variable "alb_cloudlet_policy_name" {
  type        = string
  default     = ""
  description = <<-EOT
    ALB cloudlet policy name. Leave empty for Stage 1 (initial setup).
    Set to the policy name created in Stage 2 when running Stage 3 (add ALB behavior).
    Requires the rules-as-hcl module to support this variable.
  EOT
}

variable "alb_cloudlet_policy_id" {
  type        = number
  default     = 0
  description = <<-EOT
    ALB cloudlet policy ID. Leave empty for Stage 1 (initial setup).
    Set to the policy ID created in Stage 2 when running Stage 3 (add ALB behavior).
    Requires the rules-as-hcl module to support this variable.
  EOT
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "ALB policy description / change notes"
}

variable "alb_load_balancers" {
  type = map(object({
    id                  = string
    description         = string
    version_description = string
    balancing_type      = string
  }))
  description = "Map of load balancer configurations"
}

variable "alb_lb_data_centers" {
  type = map(object({
    origin_id                    = string
    load_balancer_hostname       = string
    load_balancer_liveness_hosts = list(string)
  }))
  description = "Map of ALB configuration parameters"
}

variable "activation_network" {
  type        = string
  default     = "staging"
  description = "Network to activate on: staging or production"
}