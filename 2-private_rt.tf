resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = var.private-rt-name
  }
}

resource "aws_route_table_association" "pri-rt-association-1" {
  subnet_id = aws_subnet.app-subnet1.id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "pri-rt-association-2" {
  subnet_id = aws_subnet.app-subnet2.id
  route_table_id = aws_route_table.private_route.id
}