#Allocate elastic ip address
resource "aws_eip" "eip-for-nat-gateway-1" {
  vpc      = true

  tags = {
      Name = "eip1"
  }

}

#Allocate elastic ip address 2
resource "aws_eip" "eip-for-nat-gateway-2" {
  vpc      = true

  tags = {
      Name = "eip2"
  }

}

#Create NAT Gateway 1
resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.eip-for-nat-gateway-1.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "nat-gateway 1"
  }

}

#Create NAT Gateway 2
resource "aws_nat_gateway" "nat-gateway-2" {
  allocation_id = aws_eip.eip-for-nat-gateway-2.id
  subnet_id     = aws_subnet.public-subnet-2.id

  tags = {
    Name = "nat-gateway 2"
  }

}