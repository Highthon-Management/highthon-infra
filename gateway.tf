# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = { Name = "highthon-igw"}
}

resource "aws_eip" "nat" {
}

# NAT 게이트웨이 생성
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.private-subnet-a.id

  tags = {
    Name = "highthon-nat-gw"
  }
}