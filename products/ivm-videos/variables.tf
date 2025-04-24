variable "contract_id" {
  type        = string
  description = "Contract ID for property/config creation"
}

variable "policy_set_name" {
  type        = string
  description = "Name for policyset"
}

variable "region" {
  type        = string
  description = "The geographic region for which the media using this policy set is optimized: US, EMEA, ASIA, AUSTRALIA, JAPAN or CHINA"
  default     = "US"
}

variable "activate_on_production" {
  type        = bool
  description = "Boolean switch to activate to production. If false, policy is only pushed to staging"
  default     = false
}
