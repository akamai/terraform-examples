# -------------------------------------------------
# Common Variables 
# -------------------------------------------------

variable "group_name" {
  description = "Akamai Group Name"
  type        = string
}

variable "config_name" {
  description = "Security Configuration Name. Used to create the prefix and description for the network lists."
  type        = string
}
