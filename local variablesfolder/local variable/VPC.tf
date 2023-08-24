resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames =true
  assign_generated_ipv6_cidr_block =true
  tags = {
    Name = "main"
  }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/20"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "publicsubnet"
}
}
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.main.id
  route {
  cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}
tags ={
    Name = "publicrt"
}
}
resource "aws_route_table_association" "public-subnet-route-table-ass0ciation"
subnet_id = aws_subnet.public-subnet.id
route_table-id = aws_route_table.public-rt.id
}
resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.main.id
    cider_block = "10.0.2.0/20"
    availability_zone = "us-east-1a
    map_public_ip_on_launch = false
    tags ={
        Name = "privatesubnet"
}
}
