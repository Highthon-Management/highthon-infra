resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.public-subnet-a.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-c" {
  subnet_id      = aws_subnet.public-subnet-c.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private-a" {
  subnet_id      = aws_subnet.private-subnet-a.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-c" {
  subnet_id      = aws_subnet.private-subnet-c.id
  route_table_id = aws_route_table.private-rt.id
}