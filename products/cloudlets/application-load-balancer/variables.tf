variable "group_id" {
  type        = string
  description = "Group ID for the Cloudlet policy"
}

variable "policy_name" {
  type        = string
  description = "Cloudlet Policy Name"
}

variable "description" {
  type        = string
  description = "Cloudlet version description"
}

variable "env" {
  type    = string
  default = "staging"
}

variable "associated_properties" {
  type        = list(string)
  description = "List of associated properties for the Cloudlet policy"
}

variable "alb_load_balancers" {
  type = map(object({
    id                  = string
    description         = string
    version_description = string
    balancing_type      = string
  }))
  description = "Map of load balancer configurations"
}

# For simplicity only these parameters have been included. Additional parameters (i.e. latitude, longitude, continent, country, state_or_province, city) can be added as needed.
variable "alb_lb_data_centers" {
  type = map(object({
    origin_id                    = string
    load_balancer_hostname       = string
    load_balancer_liveness_hosts = list(string)
  }))
  description = "Map of ALB configuration parameters"
}