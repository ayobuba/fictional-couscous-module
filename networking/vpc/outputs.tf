output "vpc_id" {
  value = aws_vpc.production_vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.production_vpc.cidr_block
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet-1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet-2.id
}

output "public_subnet_3_id" {
  value = aws_subnet.public_subnet-3.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_subnet-1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.public_subnet-2.id
}

output "private_subnet_3_id" {
  value = aws_subnet.public_subnet-3.id
}