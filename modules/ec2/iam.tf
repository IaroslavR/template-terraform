resource "aws_iam_role" "ec2_role" {
  name               = "${local.name}-ec2-role"
  assume_role_policy = file("${path.module}/files/role_policy.json")
  tags               = var.tags
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${local.name}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy" "ec2_policy" {
  name   = "${local.name}-ec2-policy"
  role   = aws_iam_role.ec2_role.id
  policy = file("${path.module}/files/access_policy.json")
}
