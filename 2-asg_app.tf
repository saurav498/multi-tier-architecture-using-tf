resource "aws_autoscaling_group" "app-instance-asg" {
  name = var.app-instance-name
  max_size = 4
  desired_capacity = 2
  min_size = 1
  vpc_zone_identifier = [ aws_subnet.app-subnet1.id, aws_subnet.app-subnet2.id ]
  target_group_arns = [ aws_lb_target_group.target-grp-app.arn ]
  health_check_type = "EC2"

  launch_template {
    id = aws_launch_template.template-app.id
    version = aws_launch_template.template-app.latest_version
  }
}