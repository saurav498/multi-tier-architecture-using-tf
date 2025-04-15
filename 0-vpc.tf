resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr-block

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc-name
  }
}