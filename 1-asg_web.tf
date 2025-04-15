resource "aws_autoscaling_group" "web-instance-asg" {
  name = var.web-instance-name
  max_size = 4
  desired_capacity = 2
  min_size = 1
  vpc_zone_identifier = [ aws_subnet.web-subnet1.id, aws_subnet.web-subnet2]
  target_group_arns = [ aws_lb_target_group.target-grp-web.arn ]
  health_check_type = "EC2"

  
  launch_template {
    id = aws_launch_template.template-web.id
    version = aws_launch_template.template-web.latest_version
  }

  
  
}