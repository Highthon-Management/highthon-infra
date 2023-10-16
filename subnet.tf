resource "aws_subnet" "public-subnet-a" {
  depends_on = [aws_vpc.vpc]
  availability_zone = "ap-northeast-2a"
  cidr_block                                     = "10.0.0.0/28"
  map_public_ip_on_launch = true

  tags = {
    Name                                     = "public-subnet-a"
  }

  tags_all = {
    Name                                     = "public-subnet-a"
  }

  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public-subnet-c" {
  depends_on = [aws_vpc.vpc]
  availability_zone = "ap-northeast-2c"
  cidr_block                                     = "10.0.0.16/28"
  map_public_ip_on_launch = true

  tags = {
    Name                                     = "public-subnet-c"
  }

  tags_all = {
    Name                                     = "public-subnet-c"
  }

  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "private-subnet-a" {
  depends_on = [aws_vpc.vpc]
  availability_zone = "ap-northeast-2a"
  cidr_block                                     = "10.0.0.32/28"
  map_public_ip_on_launch                        = false
  vpc_id                                         = aws_vpc.vpc.id
  tags = {
    Name                                     = "private-subnet-a"
  }

  tags_all = {
    Name                                     = "private-subnet-a"
  }
}

resource "aws_subnet" "private-subnet-c" {
  depends_on = [aws_vpc.vpc]
  availability_zone = "ap-northeast-2c"
  cidr_block                                     = "10.0.0.48/28"
  map_public_ip_on_launch                        = false
  vpc_id                                         = aws_vpc.vpc.id
  tags = {
    Name                                     = "private-subnet-c"
  }

  tags_all = {
    Name                                     = "private-subnet-c"
  }
}