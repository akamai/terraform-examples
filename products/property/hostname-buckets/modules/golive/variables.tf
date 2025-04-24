variable "hostnames" {
  type        = list(string)
  description = "A list of hostnames to include in this configuration"
}

variable "property_name" {
  type        = string
  description = "Name for your property"
}

variable "zone" {
  type        = string
  description = "The DNS zone that we're going live with"
}

variable "edge_hostname" {
  type        = string
  description = "Your Edge Hostname (without .edgesuite.net domain suffix)"
}
