# -------------------------------------------------
# Common Variables 
# -------------------------------------------------

variable "group_name" {
  description = "Akamai Group Name"
  type        = string
}

variable "namespace_name" {
  description = "EKV Namespace Name"
  type        = string
}

variable "geo_location" {
  description = "Geo Location for EKV Database"
  type        = string
  default     = "US"
}

variable "ekv_group_name_1" {
  description = "Edge KV Group Name #1"
  type        = string
}

variable "ekv_group_name_2" {
  description = "Edge KV Group Name #2"
  type        = string
}

variable "network" {
  description = "Akamai Network (staging or production)"
  type        = string
  default     = "staging"
}

