resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public-rt-name
  }
}

resource "aws_route_table_association" "pub-rt-association-1" {
  subnet_id = aws_subnet.web-subnet1
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "pub-rt-association-2" {
  subnet_id = aws_subnet.web-subnet2
  route_table_id = aws_route_table.public_route.id
}
