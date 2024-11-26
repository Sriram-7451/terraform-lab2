output "fridayhitt_vpc_id" {
  value = aws_vpc.fridayhitt_vpc.id
}

output "fridayhitt_public_subnet_id" {
  value = aws_subnet.fridayhitt_public_subnet.id
}

output "fridayhitt_private_subnet_id" {
  value = aws_subnet.fridayhitt_private_subnet.id
}