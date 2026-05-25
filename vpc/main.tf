resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "microservices-demo-vpc"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "microservices-demo-igw"
  }
}



resource "aws_subnet" "pb1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}



resource "aws_subnet" "pb2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}


resource "aws_route_table" "rw" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}


resource "aws_route_table_association" "pb1" {
  subnet_id      = aws_subnet.pb1.id
  route_table_id = aws_route_table.rw.id
}


resource "aws_route_table_association" "pb2" {
  subnet_id      = aws_subnet.pb2.id
  route_table_id = aws_route_table.rw.id
}
