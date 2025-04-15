resource "aws_security_group" "asg-security-grp-web" {
  name = var.asg-web-name
  vpc_id = aws_vpc.vpc.id
  description = "ASG Security Group"

  ingress {
    description = "HTTP from ALB"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.alb-security-group-web.id]
  }

  ingress {
    description = "SSH from anywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "OUT-going"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.asg-sg-web-name
  }
}