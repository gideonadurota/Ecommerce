#Create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Test VPC"   
  }
}

#Create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Test Internet Gateway"
  }
}

#Create public subnet 1
resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public-subnet-1-cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public subnet 1"
  }
}

#Create public subnet 2
resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public-subnet-2-cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public subnet 2"
  }
}

#Create route table and add public route
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "Public route table"
  }
}

#Associate public-subnet-1 to public-route-table
resource "aws_route_table_association" "public-subnet-1-public-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

#Associate public-subnet-2 to public-route-table
resource "aws_route_table_association" "public-subnet-2-public-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

#Create the private subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private-subnet-1-cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet 1 | App tier"
  }
}

#Create the private subnet 2
resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private-subnet-2-cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet 2 | App tier"
  }
}

#Create the private subnet 3
resource "aws_subnet" "private-subnet-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private-subnet-3-cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet 3 | database tier"
  }
}

#Create the private subnet 4
resource "aws_subnet" "private-subnet-4" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private-subnet-4-cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet 4 | database tier"
  }
}

