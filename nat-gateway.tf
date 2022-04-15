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