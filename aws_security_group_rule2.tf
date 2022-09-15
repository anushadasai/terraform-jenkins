resource "aws_security_group_rule" "main-node-ingress-cluster" {
  type                     = "ingress"
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = aws_security_group.main-node.id
  source_security_group_id = aws_security_group.eks.id
  to_port                  = 65535
}