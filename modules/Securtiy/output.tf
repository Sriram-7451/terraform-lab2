output "public_security_group_id" {
  value = aws_security_group.fridayhitt_public_security_group.id
}

output "private_security_group_id" {
  value = aws_security_group.fridayhitt_private_security_group.id
}

output "jumpbox_security_group_id" {
  value = aws_security_group.fridayhitt_jumpbox_security_group.id
}