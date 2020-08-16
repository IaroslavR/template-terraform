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

variable azs {
  description = "Number of AWS availability zones in VPC"
  type        = number
  default     = 2
}

variable "cidr_block" {
  description = "AWS VPC CIDR block"
  type        = string
  default     = "10.1.0.0/16"
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway fo VPC"
  type        = bool
  default     = false
}

variable database_subnets {
  description = "Database subnets"
  type        = set(string)
  default = [
    "10.1.21.0/24",
    "10.1.22.0/24"
  ]
}

variable private_subnets {
  description = "Private subnets"
  type        = set(string)
  default = [
    "10.1.1.0/24",
    "10.1.2.0/24"
  ]
}

variable public_subnets {
  description = "Public subnets"
  type        = set(string)
  default = [
    "10.1.11.0/24",
    "10.1.12.0/24"
  ]
}
