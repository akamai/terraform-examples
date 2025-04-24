variable "hostnames" {
  type        = list(string)
  description = "A list of hostnames to create challenges for. Unfortunately this is needed because Terraform wants to know how many records it's creating at plan time and challenges map isn't know until run time"
}

variable "challenges" {
  type        = map(string)
  description = "A map of challenge hostnames to their CNAME targets"
}

variable "zone" {
  type        = string
  description = "The DNS zone that we're adding the challenge records"
}

