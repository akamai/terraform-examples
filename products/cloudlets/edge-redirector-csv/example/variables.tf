variable "csv" {
  type        = string
  description = <<EOF
The CSV file is similar to one that you'd download from Control Center GUI and should have the following headings:-

```
ruleName,matchURL,useRelativeUrl,redirectURL,statusCode
```

In addition, it should be passed to the module as follows:-

```
csv = file(\"redirects.csv\")
```
EOF
}

variable "group_id" {
  type        = string
  description = "The group id that contains your cloudlet"
}

variable "associated_properties" {
  type        = list(string)
  description = "The properties that are associated with this cloudlet policy"
}

variable "policy_name" {
  type        = string
  description = "The name of the cloudlet policy"
}

variable "env" {
  type        = string
  default     = "staging"
  description = "The environment to which this should be deployed"
}
