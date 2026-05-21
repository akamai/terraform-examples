variable "group_id" {
  type        = string
  description = "Group ID for the Cloudlet policy"
}

variable "name" {
  type        = string
  description = "Cloudlet Policy Name"
}

variable "cloudlet_code" {
  type        = string
  description = "Cloudlet Type. Allowed values for shared policies: AP AS ER FR CD IG"
}

variable "description" {
  type        = string
  description = "Cloudlet version description"
}

variable "env" {
  type    = string
  default = "staging"
}
