#Allocate elastic ip address
resource "aws_eip" "eip-for-nat-gateway-1" {
  vpc      = true

  tags = {
      Name = "eip1"
  }

}