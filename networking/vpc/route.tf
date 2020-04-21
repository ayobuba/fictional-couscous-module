resource "aws_route" "nat_gw_route" {
  route_table_id = aws_route_table.private_route_table.id
  nat_gateway_id = aws_nat_gateway.nat-gw.id
  destination_cidr_block = "0.0.0.0/0"

}

resource "aws_route" "public_internet_gw_route" {
  route_table_id = aws_route_table.public_route_table.id
  gateway_id = aws_internet_gateway.production_igw.id
  destination_cidr_block = "0.0.0.0/0"
}
