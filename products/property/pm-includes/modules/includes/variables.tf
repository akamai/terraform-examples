variable "contract_id" {
  type = string
}

variable "group_id" {
  type = string
}

variable "contacts" {
  type        = list(string)
  description = "A list of contacts who will be contacted when this config is deployed"
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

variable "rule_format" {
  type        = string
  description = "The rule format as returned by the akamai_property_rules_builder"
}

variable "rules" {
  type        = string
  description = "The json rule tree as returned by the akamai_property_rules_builder"
}

