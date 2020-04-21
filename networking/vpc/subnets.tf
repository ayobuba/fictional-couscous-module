################
#Public Subnets#
################
resource "aws_subnet" "public_subnet-1" {
  cidr_block = var.public_subnet_1_cidr
  vpc_id = aws_vpc.production_vpc.id
  availability_zone = "us-east-2a"

  tags = {Name = "Public-Subnet-1"}
}

resource "aws_subnet" "public_subnet-2" {
  cidr_block = var.public_subnet_2_cidr
  vpc_id = aws_vpc.production_vpc.id
  availability_zone = "us-east-2b"

  tags = {Name = "Public-Subnet-2"}
}

resource "aws_subnet" "public_subnet-3" {
  cidr_block = var.public_subnet_3_cidr
  vpc_id = aws_vpc.production_vpc.id
  availability_zone = "us-east-2c"

  tags = {Name = "Public-Subnet-3"}
}

##################
#Private Subnets #
##################

resource "aws_subnet" "private_subnet-1" {
  cidr_block = var.private_subnet_1_cidr
  vpc_id = aws_vpc.production_vpc.id
  availability_zone = "us-east-2a"

  tags = {Name = "Private-Subnet-1"}
}

resource "aws_subnet" "private_subnet-2" {
  cidr_block = var.private_subnet_2_cidr
  vpc_id = aws_vpc.production_vpc.id
  availability_zone = "us-east-2b"

  tags = {Name = "Private-Subnet-2"}
}

resource "aws_subnet" "private_subnet-3" {
  cidr_block = var.private_subnet_3_cidr
  vpc_id = aws_vpc.production_vpc.id
  availability_zone = "us-east-2c"

  tags = {Name = "Private-Subnet-3"}
}