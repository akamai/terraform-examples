# -------------------------------------------------
# Common Variables 
# -------------------------------------------------

variable "group_name" {
  description = "Akamai Group Name"
  type        = string
}

variable "stream_name" {
  description = "DataStream Name"
  type        = string
}

variable "properties" {
  description = "List of Associated Properties to the DataStream"
  type        = list(string)
}

variable "notification_emails" {
  description = "List of Notification Emails"
  type        = list(string)
}

variable "datadog_connector" {
  description = "Datadog Connector settings"
  type = object({
    display_name = string
    endpoint     = string
    auth_token   = string
  })
}