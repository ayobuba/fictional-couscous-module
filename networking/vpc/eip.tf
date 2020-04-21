resource "aws_eip" "elastic_ip_for_nat_gw" {
  vpc = true
  associate_with_private_ip = "10.0.0.5"

  tags = {
    Name = "Production-EIP"
  }
}
