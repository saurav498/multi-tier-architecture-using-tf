resource "aws_security_group" "alb-sg-web" {
  vpc_id = aws_vpc.vpc.id
  name = var.alb-web-name
  description = "ALB security group"

  ingress {
    description = "HTTP from anywhere"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "OUT-going"
    from_port = 9
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = var.alb-sg-web-name
  }
}