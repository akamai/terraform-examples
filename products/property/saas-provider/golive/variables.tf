variable "property_name" {
  type        = string
  description = "Name for your property"
}

variable "edge_hostname" {
  type        = string
  description = "The edge hostname for your hostname(s)"
}

variable "hostnames" {
  type        = list(string)
  description = "A list of hostnames to include in this configuration"
}

variable "zone" {
  type        = string
  description = "The DNS zone that we're adding the challenge records"
}