# Set account-wide variables. These are automatically pulled in to configure the remote state bucket
# in the root terragrunt.hcl configuration.
locals {
  aws_account_id = "CHANGE_ME"
  aws_role_arn   = "arn:aws:iam::CHANGE_ME:role/OrganizationAccountAccessRole"
}
