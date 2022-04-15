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

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}