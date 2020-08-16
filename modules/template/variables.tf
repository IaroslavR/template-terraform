variable "application" {
  description = "Application name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Map of key-value pairs to use for tags"
  type        = map(string)
}
