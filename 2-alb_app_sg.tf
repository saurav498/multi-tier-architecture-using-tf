resource "aws_security_group" "alb-sg-app" {
  name = var.alb-sg-app-name
  vpc_id = aws_vpc.vpc.id
  description = "ALB security group for app"

  ingress {
    description = "HTTP from Internet"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ aws_security_group.asg-security-grp-web.id ]
  }

  egress {
    description = "OUT-going"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.alb-sg-app-name
  }
}