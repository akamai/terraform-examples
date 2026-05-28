variable "hostnames" {
  description = "Map of hostnames to their validation_scope. Key is domain_name."
  type = map(object({
    validation_scope = string
  }))
  validation {
    condition = alltrue([
      for hostname, config in var.hostnames :
      can(regex("^([a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,}$", hostname))
    ])
    error_message = "Each key in the hostnames map must be a valid hostname (only letters, numbers, dots, and hyphens are allowed). Example: 'www.example-demo.com', 'www-2.example-demo.com', 'www.example.com'."
  }
  validation {
    condition = alltrue([
      for hostname, config in var.hostnames :
      contains(["HOST", "DOMAIN", "WILDCARD"], config.validation_scope)
    ])
    error_message = "validation_scope must be one of: HOST, DOMAIN, WILDCARD."
  }
}
