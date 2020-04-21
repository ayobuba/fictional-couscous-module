##################
#Route Tables #
##################

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.production_vpc.id

  tags = {Name = "Public-Route-Table"}
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.production_vpc.id

  tags = {Name = "Private-Route-Table"}
}

################################
#Route Tables Associations    ##
################################


resource "aws_route_table_association" "public_subnet_1_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnet-1.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnet-2.id
}

resource "aws_route_table_association" "public_subnet_3_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnet-3.id
}


resource "aws_route_table_association" "private_subnet_1_association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnet-1.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnet-2.id
}

resource "aws_route_table_association" "private_subnet_3_association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnet-3.id
}