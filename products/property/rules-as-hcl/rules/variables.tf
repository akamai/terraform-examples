variable "default_origin" {
  type        = string
  description = "Default origin hostname"
}

variable "default_cpcode" {
  type        = number
  description = "ID for default CP Code behavior"
}

variable "td_region" {
  type        = string
  description = "Tiered distribution region"
  default     = "CH2"
}

variable "include_ivm_images" {
  type        = bool
  default     = false
  description = "Boolean flag to include Image Manager (Images) rule"
}

variable "ivm_images_policyset" {
  type        = string
  description = "Image & Video Manager (Images) Policy Set"
  default     = "NONE"
}

variable "ivm_images_pristine_cp_code" {
  type        = number
  default     = 0
  description = "Pristine CP Code ID for Image & Video Manager (Images)"
}

variable "ivm_images_derivative_cp_code" {
  type        = number
  default     = 0
  description = "Derivative CP Code ID for Image & Video Manager (Images)"
}
