resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = local.name
  public_key = tls_private_key.this.public_key_openssh

  tags = var.tags
}
