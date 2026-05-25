variable "group_name" {
  type        = string
  description = "The name of the Akamai group."
}

variable "name" {
  type        = string
  description = "The name of the GTM Domain."
}

variable "emails" {
  type        = list(string)
  description = "A list of email addresses to notify when changes are made to the GTM domain."
}

variable "comment" {
  type        = string
  description = "A comment to add to the GTM domain."
}