resource "aws_vpc" "hithere" {
  cidr_block = "10.0.0.0/23"
}

resource "aws_subnet" "hithere-a" {
  vpc_id     = aws_vpc.hithere.id
  cidr_block = "10.0.0.0/24"

  availability_zone = "us-east-1a"
}

resource "aws_subnet" "hithere-b" {
  vpc_id     = aws_vpc.hithere.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "us-east-1b"
}
