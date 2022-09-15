resource "aws_autoscaling_group" "main" {
  desired_capacity     = 3
  launch_configuration = aws_launch_configuration.main.id
  max_size             = 6
  min_size             = 1
  name                 = "terraform-eks-main"
  vpc_zone_identifier  = [aws_subnet.a.id, aws_subnet.b.id, aws_subnet.c.id]
}