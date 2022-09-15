resource "aws_iam_instance_profile" "main-node" {
  name = "terraform-eks-main"
  role = aws_iam_role.main-node.name
}