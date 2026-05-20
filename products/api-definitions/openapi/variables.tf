variable "contract_id" {
  type = string
}

variable "group_name" {
  type = string
}

variable "notes" {
  type        = string
  description = "Version notes to include with each activation"
}

variable "emails" {
  type = list(string)
}