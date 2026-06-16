variable "group_id" {
  type        = string
  description = "Group ID for the Cloudlet policy"
}

variable "policy_name" {
  type        = string
  description = "Cloudlet Policy Name"
}

variable "description" {
  type        = string
  description = "Cloudlet version description"
}

variable "env" {
  type    = string
  default = "staging"
}

variable "associated_properties" {
  type        = list(string)
  description = "List of associated properties for the Cloudlet policy"
}

variable "origin_id_1" {
  type        = string
  description = "Origin ID for the first data center"
}

variable "origin_id_2" {
  type        = string
  description = "Origin ID for the second data center"
}