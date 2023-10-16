# public routing
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "public-rt" }
  tags_all = { Name = "public-rt" }
}

# private routing
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id
  tags = { Name = "private-rt" }
  tags_all = { Name = "private-rt" }
}
