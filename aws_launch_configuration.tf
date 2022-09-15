resource "aws_launch_configuration" "main" {
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.main-node.name
  image_id                    = data.aws_ami.eks-worker.id
  instance_type               = "t3.small"
  name_prefix                 = "terraform-eks-main"
  security_groups             = [aws_security_group.main-node.id]
  user_data_base64            = base64encode(local.main-node-userdata)

  lifecycle {
    create_before_destroy = true
  }
}