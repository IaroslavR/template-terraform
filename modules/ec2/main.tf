data "aws_ami" "this" {
  most_recent = true
  owners      = var.ami_owners
  filter {
    name   = "name"
    values = [var.ami_name]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  name = "${var.application}-${var.environment}-${var.instance_name}"
}

module "ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "v3.15"

  name        = "${local.name}-ec2-sg"
  description = "Security group for SSH access to the EC2 instance"

  vpc_id                           = var.vpc_id
  ingress_cidr_blocks              = ["0.0.0.0/0"]
  computed_ingress_rules           = ["ssh-tcp"]
  number_of_computed_ingress_rules = 1
  egress_rules                     = ["all-all"]
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "v2.15"

  name = local.name

  ami                         = data.aws_ami.this.id
  associate_public_ip_address = var.instance_public_ip
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  instance_count              = var.instance_count
  instance_type               = var.instance_type
  key_name                    = module.key_pair.this_key_pair_key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [module.ec2_security_group.this_security_group_id]

  tags = var.tags

  root_block_device = [
    {
      volume_size = var.instance_volume_size
    },
  ]
}
