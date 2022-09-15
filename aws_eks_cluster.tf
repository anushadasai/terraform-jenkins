resource "aws_eks_cluster" "main" {
  name     = var.cluster-name
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    security_group_ids      = [aws_security_group.eks.id]
    subnet_ids              = [aws_subnet.a.id, aws_subnet.b.id, aws_subnet.c.id]
    endpoint_private_access = true
    endpoint_public_access  = false
  }

  depends_on = [
    aws_iam_role_policy_attachment.main-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.main-cluster-AmazonEKSServicePolicy,
  ]
}