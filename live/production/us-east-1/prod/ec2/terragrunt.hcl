locals {
  instance_name  = "test"
  ami_name       = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
  instance_count = 0
  instance_type  = "t3.micro" # Free Tier
}

# Terragrunt will copy the Terraform configurations specified by the source parameter,
# along with any files in the working directory, into a temporary folder, and execute
# your Terraform commands in that folder.
terraform {
  source = "../../../../../modules/ec2"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependency "shared" {
  config_path = "../shared"
}

# These are the variables we have to pass in to use the module specified in the terragrunt
# configuration above
inputs = {
  vpc_id         = dependency.shared.outputs.vpc_id
  subnet_id      = dependency.shared.outputs.public_subnets[0]
  instance_name  = local.instance_name
  ami_name       = local.ami_name
  instance_count = local.instance_count
  instance_type  = local.instance_type
}
