resource "aws_lb" "alb-web" {
  name = var.alb-web-name
  internal = false
  load_balancer_type = "application"
  security_groups = [ aws_security_group.alb-sg-web.id ]
  subnets = [ aws_subnet.web-subnet1, aws_subnet.web-subnet2 ]
}