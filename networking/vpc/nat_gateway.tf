resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.elastic_ip_for_nat_gw.id
  subnet_id = aws_subnet.public_subnet-1.id

  tags = {Name = "Production-NAT-GW"}

  depends_on = [aws_eip.elastic_ip_for_nat_gw]
}

