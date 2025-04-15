resource "aws_security_group" "asg-app-sg" {
  name = var.asg-app-name
  vpc_id = aws_vpc.vpc.id
  description = "APP security group"

  ingress {
    description = "HTTP from ALB"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ aws_security_group.alb-security-group-app.id ]
  }

  ingress {
    description = "SSH from anywhere or your IP"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.asg-security-grp-web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.asg-sg-app-name
  }
}
