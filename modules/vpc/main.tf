data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name = "${var.application}-${var.environment}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "v2.47"

  name = local.name

  azs                = slice(data.aws_availability_zones.available.names, 0, var.azs)
  cidr               = var.cidr_block
  enable_nat_gateway = var.enable_nat_gateway

  database_subnets = var.database_subnets
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets

  tags = var.tags
}
