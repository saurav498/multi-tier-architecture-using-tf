resource "aws_nat_gateway" "nat-gw" {
    subnet_id = aws_subnet.app-subnet1.id
    allocation_id = aws_eip.elastic-ip.id
    connectivity_type = "public"
    
    tags = {
      Name = var.nat-gw-name
    }

    depends_on = [ aws_internet_gateway.igw ]
}