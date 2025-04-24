# -------------------------------------------------
# Common Variables 
# -------------------------------------------------
variable "environment" {
  description = "Environment to deploy/activate"
  type        = string
}

variable "policy_name" {
  description = "Cloudlet Policy Name"
  type        = string
}

variable "description" {
  description = "Description for the Cloudlet Policy"
  type        = string
  default     = "ER Cloudlet deployed by TF"
}

variable "group_name" {
  description = "Akamai Group Name"
  type        = string
}

variable "cloudlet_code" {
  description = "Cloudlet Type Code"
  type        = string
  default     = "ER"
}

variable "network" {
  description = "Akamai Network: staging or production"
  type        = string
  default     = "staging"
}
