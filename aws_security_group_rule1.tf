resource "aws_security_group_rule" "main-node-ingress-self" {
  type              = "ingress"
  description       = "Allow node to communicate with each other"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.main-node.id
  to_port           = 65535
  cidr_blocks       = [
    aws_subnet.a.cidr_block,
    aws_subnet.b.cidr_block,
    aws_subnet.c.cidr_block,
    var.vpn_cidr_block
  ]
}