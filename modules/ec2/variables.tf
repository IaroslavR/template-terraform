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


variable "ami_name" {
  description = "AMI name"
  type        = string
}

variable "ami_owners" {
  description = "List of allowed AMI image owners"
  default     = ["self", "099720109477"] # + Canonical
}

variable "instance_count" {
  description = "AWS EC2 instances count"
  type        = number
  default     = 0
}

variable "instance_name" {
  description = "EC2 instance name"
}

variable "instance_type" {
  description = "AWS EC2 instance type"
  type        = string
}

variable "instance_volume_size" {
  description = "AWS EC2 instance volume size"
  type        = number
  default     = 10
}

variable "instance_public_ip" {
  description = "Associate public IP address"
  type        = bool
  default     = true
}

variable "subnet_id" {
  description = "EC2 instance subnet id"
}

variable "vpc_id" {
  description = "Shared VPC id"
}
