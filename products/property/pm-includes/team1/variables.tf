variable "group_name" {
  type        = string
  description = "Group name"
}

variable "product_id" {
  type        = string
  description = "Name of the required product"
}

variable "include_name" {
  type        = string
  description = "Name for your include"
}

variable "contacts" {
  type        = list(string)
  description = "A list of contacts who will be contacted when this config is deployed"
}