variable "contract_id" {
  type    = string
}

variable "group_id" {
  type    = string
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

variable "property_name" {
  type        = string
  description = "Name for your property"
}

variable "hostnames" {
  type        = list(string)
  description = "The hostnames to include on this property"
}

variable "includes" {
  type        = map(list(string))
  description = "A map that maps include ids to a list of path matches"
}
